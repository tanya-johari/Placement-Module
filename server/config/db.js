const mysql = require("mysql");
const db = mysql.createConnection({
  user: "root",
  host: "localhost",
  password: "password",
  database: "pms",
  port:"3306",
});
db.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});
module.exports = db;
