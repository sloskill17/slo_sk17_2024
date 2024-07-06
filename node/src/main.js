/**
 * This is express.js example app
 */
const express = require('express');
const morgan = require('morgan');

const app = express();
const port = 3000; // Don't change (or change in docker-compose.yaml also)

/**
 * Log HTTP requests
 * @see https://expressjs.com/en/resources/middleware/morgan.html
 */
app.use(morgan('combined'));

app.get('/', (req, res) => {
  res.send('Hello world!');
});

app.listen(port, () => {
  console.log(`Web server is running on port ${port}`);
});
