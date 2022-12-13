import { Router } from "express";
import * as controller from "../controllers/product.controller";

export const stationery = Router();

stationery.get("/", controller.getStationery);
stationery.get("/:id", controller.getStationeryById);