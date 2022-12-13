import { Router } from "express";
import * as controller from "../controllers/product.controller";

export const book = Router();

book.get("/", controller.getBook);
book.get("/:id", controller.getBookById);