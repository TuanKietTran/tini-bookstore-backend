export const BillQueries = {
  addBill: `INSERT Bill (b_id, B_time, City, District, StreetNum, B_Status, Phone, Email, Customer_name, Payment_method) VALUES ($1)`,
  addEach: `INSERT INTO Included(Bill_ID,Product_UUID, Quantity) VALUES ($1)`
}