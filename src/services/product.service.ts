

import query from "../api/mysql.connector";
import { Product } from "../models/product"
import { BookQueries, ProductQueries, StationeryQueries } from "../models/product.queries";

export const getProduct = async () => {
  return await query(ProductQueries.getProduct, []);
}

export const getProductById = async (id : string) => {
  return query(ProductQueries.getProductById, [id]);
}

export const getProductByName = async (name : string) => {
  return query(ProductQueries.getProductByName, [name]);
}

export const getBook = async () => {
  return query(BookQueries.getBook, []);
}

export const getBookById = async (id : string) => {
  return query(BookQueries.getBookById, [id]);
}

export const getStationery = async () => {
  return query(StationeryQueries.getStationery, []);
}

export const getStationeryById = async (id : string) => {
  return query(StationeryQueries.getStationeryById, [id]);
}