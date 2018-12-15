var express = require('express');
var router = express.Router();
var connection = require('../db');
/* GET home page. */
router.get('/', function(req, res, next) {
	connection.query('SELECT * FROM choosetrainers', function(error, results,fields){
		console.log(results);
		if(error) throw error
		res.render('index',{
			results
		});
	});
});



router.post("/registertrainer", function (req, res, next) {
	connection.query("CALL INSERTINTrainers(?,?,?,?,?);", 
    [Name = req.param("Name"),
    Surname = req.param("Surname"),
    Email = req.param("Email"),
    Telephone = req.param("Telephone"),
    Abouttrainer = req.param("Abouttrainer")], function(error, results, fields) {
		
		if (error) {
    return console.error(error.message);
  		}
		console.log('Add to BD ');
		res.redirect("/");
	})
});

router.post("/registeruser", function (req, res, next) {
	connection.query("CALL INSERT_IN_Clients(?,?,?,?,?);", 
    [Name = req.param("username"),
    Surname = req.param("usersurname"),
    Email = req.param("useremail"),
    Telephone = req.param("usertelephone"),
    Trainer_1 = req.param("trainers")], function(error, results, fields) {
		
		if (error) {
    return console.error(error.message);
  		}
		console.log('Add to BD ');
		
	})
});

router.post("/registeruser2", function (req, res, next) {
var Services1 = req.body.service
var len = (Services1).length 
	for (i=0; i < len; i++) {
		connection.query("CALL INSERT_IN_Clients_and_Services(?);", [Number_of_service_1 = Services1[i]],
				function(error, results, fields) {
					if (error) {
    				return console.error(error.message);
  					}
  					console.log(Number_of_service_1);
					console.log('Add to BD ');
				});
	}
			
	res.redirect('/cost')
			
});


router.get('/cost', function(req, res, next) {
connection.query(
'SELECT Cost_of_abonement() AS Cost; SELECT Name as name, Surname as surname, Email as email, Telephone as number, Service as service FROM CLients_inf', [1,2],
		function(error, results,fields){
		console.log(results);
		connection.query('CALL Cost_of_abonement()')
		if(error) throw error
		res.render('index2',{
			results
		});
	});


});


module.exports = router;
