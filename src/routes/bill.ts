import { Router } from "express";
import * as controller from "../controllers/bill.controller"

export const bill = Router();

bill.post("/", controller.postBill);
