import EventProcessor from './processor.js';

class EventOrchestrator {
  constructor() {
    this.processor = new EventProcessor({
      baseDelay: 300, 
      onTaskStart: (tarea) => this._onTaskStart(tarea),
      onTaskComplete: (tarea) => this._onTaskComplete(tarea),
      onTaskError: (tarea, err) => this._onTaskError(tarea, err),
      onQueueEmpty: () => this._onQueueEmpty(),
    });
    this.startTime = null;
    this.eventTypeStats = {
      'CRITICAL': 0,
      'HIGH': 0,
      'MEDIUM': 0,
      'LOW': 0,
    };
  }
  generateEvents(count = 20) {
    console.log(`Generando ${count} eventos aleatorios...\n`);

    const eventTypes = [
      { type: 'CRITICAL', priority: 10, weight: 0.1 },
      { type: 'HIGH', priority: 7, weight: 0.2 },
      { type: 'MEDIUM', priority: 5, weight: 0.3 },
      { type: 'LOW', priority: 2, weight: 0.4 },
    ];

    for (let i = 1; i <= count; i++) {
      const rand = Math.random();
      let selectedType = eventTypes[0];
      let cumWeight = 0;

      for (const et of eventTypes) {
        cumWeight += et.weight;
        if (rand < cumWeight) {
          selectedType = et;
          break;
        }
      }

      const eventId = `EVT-${String(i).padStart(4, '0')}`;
      const eventData = {
        type: selectedType.type,
        timestamp: new Date().toISOString(),
        source: `Service-${Math.floor(Math.random() * 5) + 1}`,
        payload: {
          message: `Evento de tipo ${selectedType.type}`,
          value: Math.random() * 1000,
        },
      };

      this.processor.enqueue(eventId, eventData, selectedType.priority);
      this.eventTypeStats[selectedType.type]++;
    }
    console.log('Distribución de eventos:');
    Object.entries(this.eventTypeStats).forEach(([type, count]) => {
      const percentage = ((count / count) * 100).toFixed(1);
      console.log(`   ${type}: ${count} eventos`);
    });
    console.log();
  }
  async run() {
    this.startTime = Date.now();
    console.log('Estado inicial de la cola:');
    this.processor.queue.printQueue();
    await this.processor.process();
    this._printFinalStats();
  }

  _onTaskStart(tarea) {}

  _onTaskComplete(tarea) {}

  _onTaskError(tarea, err) {}

  _onQueueEmpty() {
    console.log('Cola completamente procesada.');
  }

  _printFinalStats() {
    const elapsed = Date.now() - this.startTime;
    console.log('Reporte Final de Procesamiento');
    const stats = this.processor.getStats();
    console.log('\nEstadísticas de Procesamiento:');
    console.log(`Eventos procesados: ${stats.procesadas}`);
    console.log(`Eventos con error: ${stats.errores}`);
    console.log(`Eventos pendientes: ${stats.pendientes}`);
    console.log(`Total: ${stats.total}`);

    console.log('\nTiempos:');
    console.log(`Tiempo total: ${(elapsed / 1000).toFixed(2)}s`);
    console.log(`Promedio por evento: ${(elapsed / stats.procesadas).toFixed(0)}ms`);

    console.log('\nDistribución de Eventos Originales:');
    Object.entries(this.eventTypeStats).forEach(([type, count]) => {
      const percentage = ((count / stats.total) * 100).toFixed(1);
      console.log(`   ${type}: ${count} (${percentage}%)`);
    });

    console.log('\nTasa de Éxito:');
    const successRate = ((stats.procesadas / (stats.procesadas + stats.errores)) * 100).toFixed(1);
    console.log(`   ${successRate}% (${stats.procesadas}/${stats.procesadas + stats.errores})`);
  }
}
async function main() {
  const orchestrator = new EventOrchestrator();
  orchestrator.generateEvents(30);
  await orchestrator.run();
}

main().catch((err) => {
  console.error('Error fatal:', err);
  process.exit(1);
});
