import express from "express";
import { createServer } from "http";
import { Worker } from "node:worker_threads";

const app = express();
const httpServer = createServer(app);
const PORT = 3000;

app.get("/fast", (req, res) => {
    res.json({ status: "ok", message: "Fast response!" });
});


app.get("/slow", (req, res) => {
    setTimeout(() => {
        res.json({ status: "ok", message: "Slow response after 5 seconds!" });
    }, 5000);
});

app.get("/heavy-cpu-block", (req, res) => {
    console.time("heavy-cpu-block");
    for (let i = 0; i < 5_000_000_000; i++) {}
    console.timeEnd("heavy-cpu-block");
    res.json({ status: "ok", message: "Heavy CPU task finished!" });
});

const runHeavyTask = (data) =>
    new Promise((resolve, reject) => {
        const worker = new Worker(new URL("./worker.js", import.meta.url));
        worker.once("message", resolve);
        worker.once("error", reject);
        worker.once("exit", (code) => {
            if (code !== 0) {
                reject(new Error(`Worker stopped with exit code ${code}`));
            }
        });
        worker.postMessage(data);
    });

app.get("/heavy-cpu-worker", async (req, res) => {
    try {
        console.time("heavy-cpu-worker");
        const result = await runHeavyTask({ iterations: 5_000_000_000 })
        console.timeEnd("heavy-cpu-worker");
        res.json(result);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }

});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});