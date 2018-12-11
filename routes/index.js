var express = require('express');
var router = express.Router();
var connection = require('../db');
/* GET home page. */
router.get('/', function(req, res, next) {
	connection.query('SELECT * FROM choosetrainers', function(error, results,fields){
		// console.log(results);
		if(error) throw error
		res.render('index',{
			results
		});
	});
  // res.render('index', { title: 'Express' });
});

module.exports = router;
