import PriorityQueue from './queue.js';

class EventProcessor {
  constructor(options = {}) {
    this.queue = new PriorityQueue();
    this.isProcessing = false;
    this.processedCount = 0;
    this.errorCount = 0;
    this.maxRetries = options.maxRetries || 3;
    this.baseDelay = options.baseDelay || 500; 
    this.onTaskStart = options.onTaskStart || (() => {});
    this.onTaskComplete = options.onTaskComplete || (() => {});
    this.onTaskError = options.onTaskError || (() => {});
    this.onQueueEmpty = options.onQueueEmpty || (() => {});
  }

  enqueue(id, data, priority = 1) {
    this.queue.add(id, data, priority);
  }

  async process() {
    if (this.isProcessing) {
      console.warn('Procesamiento ya en curso. Ignorando llamada duplicada.');
      return;
    }

    this.isProcessing = true;
    console.log('Iniciando procesamiento de cola...\n');

    while (this.queue.length > 0) {
      const tarea = this.queue.next();
      if (!tarea) break;
      this.onTaskStart?.(tarea);

      try {
        const delay = this.baseDelay * (11 - tarea.priority) / 10;
        console.log(
          `Procesando [${tarea.id}] Prioridad: ${tarea.priority} (Delay: ${delay.toFixed(0)}ms)`
        );
        await this._simulateWork(delay, tarea);
        this.processedCount++;
        this.onTaskComplete?.(tarea);
        console.log(`Completada [${tarea.id}]\n`);
      } catch (err) {
        this.errorCount++;
        console.error(`Error en [${tarea.id}]: ${err.message}\n`);
        this.onTaskError?.(tarea, err);
      }
    }

    this.isProcessing = false;
    console.log('Procesamiento finalizado.');
    console.log(
      `Estadísticas: ${this.processedCount} completadas, ${this.errorCount} errores\n`
    );
    this.onQueueEmpty?.();
  }
  async _simulateWork(ms, tarea) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        if (Math.random() < 0.1) {
          reject(new Error(`Fallo simulado en procesamiento de ${tarea.id}`));
        } else {
          resolve();
        }
      }, ms);
    });
  }
  getStats() {
    return {
      pendientes: this.queue.length,
      procesadas: this.processedCount,
      errores: this.errorCount,
      isProcessing: this.isProcessing,
      total: this.processedCount + this.errorCount + this.queue.length,
    };
  }
  printStats() {
    const stats = this.getStats();
    console.log('\nEstadísticas del Procesador:');
    console.log(`Pendientes: ${stats.pendientes}`);
    console.log(`Procesadas: ${stats.procesadas}`);
    console.log(`Errores: ${stats.errores}`);
    console.log(`Total: ${stats.total}\n`);
  }
}
export default EventProcessor;
