var express = require('express');

var app = express();

app.use(express.static('public'));

app.get('/population', function (req, res) {
	res.send('Population');
});

app.listen(8000);