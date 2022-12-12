import query from "../api/mysql.connector";
import Bill from "../models/bill";
import { BillQueries } from "../models/bill.queries";

function toArray(bill: Bill) {
  return [bill.b_id, bill.B_time, bill.City, bill.District, bill.StreetNum, bill.B_Status, bill.Phone, bill.Email, bill.Customer_name, bill.Payment_method]
}

export const postBill = async (bill: Bill) => {
  await query(BillQueries.addBill, toArray(bill));
}