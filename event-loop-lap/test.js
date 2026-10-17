import net from 'net';

function sendRequest(reqNum, delay) {
  setTimeout(() => {
    const client = net.createConnection({ port: 8080 });
    
    client.setTimeout(6000);
    
    client.on('connect', () => {
      client.write('Ping\n');
    });
    
    client.on('data', (d) => {
      console.log(`Req ${reqNum}: ${d.toString().trim()}`);
      client.end();
    });
    
    client.on('error', (err) => {
      console.error(`Req ${reqNum} Error:`, err.message);
    });
    
    client.on('timeout', () => {
      console.error(`Req ${reqNum} Timeout`);
      client.destroy();
    });
  }, delay);
}


for (let i = 1; i <= 6; i++) {
  sendRequest(i, (i - 1) * 100);
}
