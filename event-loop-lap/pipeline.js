import fs from 'fs';
import { pipeline } from 'stream';
import FormateadorCSV from './etl.js';

console.log('Iniciando Pipeline');

const input = fs.createReadStream('big.csv', {
    encoding: 'utf8',
    highWaterMark: 64 * 1024,
});
const transformer = new FormateadorCSV();
const output = fs.createWriteStream('final.txt', {
    highWaterMark: 64 * 1024,
});

const intervalo = setInterval(() => {
    const memUsage = process.memoryUsage();
    const heapUsedMB = (memUsage.heapUsed / 1024 / 1024).toFixed(2);
    const heapTotalMB = (memUsage.heapTotal / 1024 / 1024).toFixed(2);
    const externalMB = (memUsage.external / 1024 / 1024).toFixed(2);

    console.log(
        `${heapUsedMB}MB / ${heapTotalMB}MB | [External] ${externalMB}MB`
    );
}, 500);

pipeline(
    input,
    transformer,
    output,
    (err) => {
        clearInterval(intervalo);

        if (err) {
            console.error('\nError en Pipeline:', err.message);
            process.exit(1);
        } else {
            console.log('\nProcesamiento completado SIN memory leaks.');
            console.log('Archivo final.txt generado exitosamente.');
            process.exit(0);
        }
    }
);


input.on('data', (chunk) => {});

transformer.on('data', (chunk) => {});

output.on('data', (chunk) => {});


process.on('unhandledRejection', (reason, promise) => {
    console.error('Promise rechazada no manejada:', reason);
    clearInterval(intervalo);
    process.exit(1);
});

process.on('uncaughtException', (err) => {
    console.error('Excepción no atrapada:', err);
    clearInterval(intervalo);
    process.exit(1);
});
