/**
 * Serve OpenAPI specification
 * @see https://www.npmjs.com/package/swagger-ui-express
 * @see https://www.npmjs.com/package/yamljs
 * @see https://medium.com/swlh/the-easiest-way-to-start-using-swagger-in-node-js-54326864e74f
 */
const PORT = 8081;

const express = require('express');
const app = express();
const swaggerUi = require('swagger-ui-express');
const yaml = require('yamljs');

if (process.argv.length < 3) {
  console.error(`Usage: node main.js FILENAME`);
  process.exit(1);
}
const path = process.argv[2].trim();
const swaggerDocument = (path.toLocaleLowerCase().endsWith('.yaml') || path.toLocaleLowerCase().endsWith('.yml')) ? yaml.load(path) : require(path);

app.use('/', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.listen(PORT, () => {
  console.log(`OpenAPI spec doc listening on port ${PORT}`);
});
