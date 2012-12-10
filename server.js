var express = require('express');
var http = require('http');

var app = express();

// Set the folder with the static ressources (index.html, *.css, ...)
app.use(express.static('public'));

app.get('/population', function (request, response) {

	// Get population on http://www.7billionandme.org/services/population.php 
	var options = {
	  host: 'www.7billionandme.org',
	  port: 80,
	  path: '/services/population.php'
	};

	// Get the content of the url with http.request (curl like)
	var req = http.request(options, function(res) {
		
		var data;

		res.setEncoding('utf8');
		
		res.on('data', function (chunk) {
			//  retrieve the data from url
			data = chunk;
		});
		
		res.on('end',function() {
			// Remove , from the data and cast to int
			var population = parseInt(data.replace(/,/g,''),10);
			var json = { 'timestamp' : new Date().getTime()/1000 , 'population' : population };
			// Send json with response.json (set the correct mime-type header ...)
			response.json(json);
		});

	});

	req.on('error', function(e) {
	  console.log('Problem with request: ' + e.message);
	});

	req.end();

});

app.listen(8000);