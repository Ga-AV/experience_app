class PriorityQueue {
  constructor() {
    this.tareas = [];
    this.isProcessing = false;
  }

  add(id, data, priority = 1) {
    if (priority < 1 || priority > 10) {
      console.warn(`Prioridad fuera de rango: ${priority}. Usando valor 1.`);
      priority = 1;
    }

    const tarea = {
      id,
      data,
      priority,
      timestamp: Date.now(), 
    };
    this.tareas.push(tarea);
    this.tareas.sort((a, b) => {
      if (b.priority === a.priority) {
        return a.timestamp - b.timestamp;
      }
      return b.priority - a.priority;
    });
  }

  get length() {
    return this.tareas.length;
  }

  next() {
    if (this.tareas.length === 0) {
      return undefined;
    }

    const tarea = this.tareas.shift();
    return tarea;
  }

  peek() {
    if (this.tareas.length === 0) {
      return undefined;
    }
    return this.tareas[0];
  }

  clear() {
    const count = this.tareas.length;
    this.tareas = [];
    console.log(`Cola limpiada. Se eliminaron ${count} tareas.`);
  }

  printQueue() {
    console.log('\nEstado actual de la cola:');
    if (this.tareas.length === 0) {
      console.log('   (vacía)');
      return;
    }

    this.tareas.forEach((tarea, idx) => {
      const priorityLabel =
        tarea.priority >= 8 ? 'Urgente' :
        tarea.priority >= 5 ? 'Media' :
        'Baja';

      console.log(
        `   [${idx}] ${priorityLabel} | ID: ${tarea.id} | Data: ${JSON.stringify(tarea.data)}`
      );
    });
    console.log();
  }


  start() {
    if (this.isProcessing) {
      console.warn('Worker loop ya en proceso. Ignorando llamada duplicada.');
      return;
    }
    this.isProcessing = true;
    console.log('Iniciando Worker Loop No Bloqueante...\n');
    this._processLoop();
  }

  _processLoop() {
    if (this.length === 0) {
      this.isProcessing = false;
      console.log('\nCola completamente vaciada. Worker Loop finalizado.');
      return;
    }

    const tarea = this.next();
    const serializado = JSON.stringify(tarea.data);
    const latencia = (11 - tarea.priority) * 10;

    if (tarea.priority > 5) {
      console.log(
        `[URGENTE] ${tarea.id} | Prioridad: ${tarea.priority}`
      );
    }
    setTimeout(() => {
      this._processLoop();
    }, latencia);
  }
  stop() {
    this.isProcessing = false;
    console.log('\nWorker Loop detenido (emergency stop).');
  }

  getStatus() {
    return {
      isProcessing: this.isProcessing,
      queueLength: this.tareas.length,
      nextTask: this.peek(),
    };
  }
}

export default PriorityQueue;
