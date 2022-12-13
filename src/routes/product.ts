import { Router } from "express";
import * as controller from "../controllers/product.controller";

export const product = Router();

product.get("/", controller.getProduct);
product.get("/:id", controller.getProductById);
product.get("/:name", controller.getProductByName);
