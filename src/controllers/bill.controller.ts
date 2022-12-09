import { Request, RequestHandler, Response } from "express"
import Bill from "../models/bill";
import * as BillService from '../services/bill.service';


export const postBill: RequestHandler = async (req: Request, res: Response) => {
  const bill = Bill.newBill(
    req.body['B_time'], 
    req.body['City'], 
    req.body['District'], 
    req.body['StreetNum'], 
    req.body['B_Status'], 
    req.body['Phone'], 
    req.body['Email'], 
    req.body['Customer_name'], 
    req.body['Payment_method'], 
  )
  try {
    await BillService.postBill(bill)
    res.sendStatus(201)
  } catch (error) {
    console.error('[product.controller][getProduct][Error] ', typeof error === 'object' ? JSON.stringify(error) : error);
    res.status(500).json({
      message: 'There was an error when fetching product'
    });
  }
}