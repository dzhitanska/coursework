var mysql = require('mysql');
var connection = mysql.createPool({
	multipleStatements : true,
	connectionLimit: 10,
	host : 'lightos.beget.tech',
	user : 'lightos_dasha',
	password : 'r4uQk%zB',
	database : 'lightos_dasha'
});

module.exports = connection;