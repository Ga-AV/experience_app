import net from 'net';

const PORT = process.argv[2] || 3001;
const NODE_ID = `Nodo-${PORT}`;

const server = net.createServer((socket) => {
  console.log(`[+] Conexión recibida en ${NODE_ID}`);
  

  setTimeout(() => {
    socket.write(`Respuesta desde ${NODE_ID}\n`);
    socket.end(); 
  }, 500);
});

server.listen(PORT, () => {
  console.log(`${NODE_ID} escuchando en puerto ${PORT}...`);
});


server.on('error', (err) => {
  console.error(`Error en ${NODE_ID}:`, err);
  process.exit(1);
});
