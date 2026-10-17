import { Transform } from 'stream';


class FormateadorCSV extends Transform {
  constructor(options) {
    super(options);
    this.bytesProcessados = 0;
  }

  _transform(chunk, encoding, callback) {
    try {
      let dataTexto = chunk.toString();
      this.bytesProcessados += chunk.length;
      let dataMutada = dataTexto.replace(/,/g, '|');
      this.push(dataMutada);

      callback();
    } catch (err) {

      callback(err);
    }
  }

  _flush(callback) {
    console.log(`Transform completado. Bytes procesados: ${this.bytesProcessados}`);
    callback();
  }
}

export default FormateadorCSV;
