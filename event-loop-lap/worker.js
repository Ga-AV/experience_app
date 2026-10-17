import {parentPort} from 'node:worker_threads';

parentPort.once('message', ({iterations}) => {
    for (let i = 0; i < iterations; i++) {}

    parentPort.postMessage({message: "CPU finished on Worker Thread. Event Loop Free!"});
});