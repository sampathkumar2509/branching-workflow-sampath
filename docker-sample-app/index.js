const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello from Dockerized App on ACR!');
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`App running at http://localhost:${port}`);
});

