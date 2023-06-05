const mysql = require("mysql");
const db = mysql.createConnection({
  user: "root",
  host: "localhost",
  password: "abc@123",
  database: "pms",
  port:"3360",
});
db.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});
module.exports = db;
