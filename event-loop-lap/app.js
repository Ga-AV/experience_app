import PriorityQueue from './queue.js';

console.log('Interrupción de Pila Dinámica');
const q = new PriorityQueue();
console.log('Fase 1: Cargando 5000 reportes lentos (Prioridad 1)...');
const startLoad = Date.now();

for (let i = 0; i < 5000; i++) {
  q.add(`Rep-${String(i).padStart(4, '0')}`, { 
    type: 'REPORT',
    index: i,
    data: `Reporte lento número ${i}`,
  }, 1);
}

const loadTime = Date.now() - startLoad;
console.log(`${q.length} tareas cargadas en ${loadTime}ms\n`);
console.log('Fase 2: Despachando worker loop...\n');
q.start();
console.log('Fase 3: Programando inyección VIP en 2 segundos...\n');

setTimeout(() => {
    console.log('Transacciones CEO/CFO/CTO');
 
  q.add('Transf-A', { 
    type: 'TRANSACTION',
    user: 'CEO',
    amount: 1000000,
    priority: 'CRITICAL',
  }, 10);

  q.add('Transf-B', { 
    type: 'TRANSACTION',
    user: 'CFO',
    amount: 500000,
    priority: 'CRITICAL',
  }, 10);

  q.add('Transf-C', { 
    type: 'TRANSACTION',
    user: 'CTO',
    amount: 250000,
    priority: 'CRITICAL',
  }, 10);
  console.log('Transacciones VIP encoladas y reordenadas\n');
}, 2000);

const healthInterval = setInterval(() => {
  const status = q.getStatus();
  const timestamp = new Date().toLocaleTimeString();

  console.log(
    `[${timestamp}] Processing: ${status.isProcessing} | Queue: ${status.queueLength}`
  );

  if (status.queueLength === 0 && !status.isProcessing) {
    clearInterval(healthInterval);
    console.log('\nDemostración completada exitosamente.');
    process.exit(0);
  }
}, 3000);

process.on('SIGINT', () => {
  console.log('\n\nInterrupción detectada. Deteniendo worker...');
  q.stop();
  clearInterval(healthInterval);
  process.exit(0);
});

setTimeout(() => {
  console.log('\nTimeout de seguridad alcanzado. Finalizando...');
  q.stop();
  clearInterval(healthInterval);
  process.exit(0);
}, 60000); 


