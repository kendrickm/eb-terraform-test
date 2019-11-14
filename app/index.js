const express = require('express')
const app = express()
const port = process.env.PORT || 3000;

app.get('/', (req, res) => res.send('Welcome to Learn with Homer! Now with some updates!'))

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
