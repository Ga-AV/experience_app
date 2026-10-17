
import net from 'net';

const NODES = [3001, 3002, 3003];
let idx = 0;

const balancer = net.createServer((client) => {
  const targetPort = NODES[idx % NODES.length];
  idx++;
  
  console.log(`Enrutando tráfico → Puerto ${targetPort}`);

  const node = net.createConnection({ port: targetPort });
  
  node.setTimeout(5000);

  client.pipe(node);
  node.pipe(client);

  node.on('error', (err) => {
    console.error(`Nodo ${targetPort} caído:`, err.message);
    if (!client.destroyed) {
      client.end('Error Interno del Servidor\n');
    }
  });
  
  node.on('timeout', () => {
    console.error(`Nodo ${targetPort} timeout`);
    node.destroy();
    if (!client.destroyed) {
      client.end('Error Interno del Servidor\n');
    }
  });

  client.on('error', (err) => {
    console.error(`Error del cliente:`, err.message);
    node.end();
  });
});

balancer.listen(8080, () => console.log('Proxy OK en 8080'));
