import express from "express";
import logger from "morgan";
import * as path from "path";
import helmet from 'helmet';
import cors from 'cors';
import * as MySQLConnector from './api/mysql.connector';


import { errorHandler, errorNotFoundHandler } from "./middlewares/errorHandler";

// Routes
import { index } from "./routes/index";
import { product } from "./routes/product"
// Create Express server
export const app = express();

// Express configuration
// adding set of security middlewares
app.use(helmet());
// enable all CORS request
app.use(cors());


app.set("port", process.env.PORT || 3000);

app.use(logger("dev"));

app.use(express.static(path.join(__dirname, "../public")));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use("/", index);
app.use("/product", product);

app.use(errorNotFoundHandler);
app.use(errorHandler);