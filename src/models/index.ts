import mysql from 'mysql'
import * as dotenv from "dotenv";
dotenv.config();

export const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PWD,
  database: process.env.DB_NAME
});

db.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});