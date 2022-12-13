import { Request, RequestHandler, Response } from "express";
import Bill from "../models/bill";
import * as BillService from "../services/bill.service";

export const postBill: RequestHandler = async (req: Request, res: Response) => {
  const bill = Bill.newBill(
    req.body["b_time"],
    req.body["city"],
    req.body["district"],
    req.body["streetNum"],
    req.body["b_status"],
    req.body["phone"],
    req.body["email"],
    req.body["customer_name"],
    req.body["payment_method"]
  );

  try {
    await BillService.postBill(bill);
    req.body["include"].map(async (el: any) => {
      let item = new BillService.Include(bill.b_id, el.p_id, el.amount);
      await BillService.addCart(item);
    });

    res.sendStatus(201);
  } catch (error) {
    console.error(
      "[product.controller][getProduct][Error] ",
      typeof error === "object" ? JSON.stringify(error) : error
    );
    res.status(500).json({
      message: "There was an error when fetching product",
    });
  }
};
