import { execute } from "../api/mysql.connector"
import { Product } from "../models/product"
import { BookQueries, ProductQueries, StationeryQueries } from "../models/product.queries";

export const getProduct = async () => {
  return execute<Product>(ProductQueries.getProduct, []);
}

export const getProductById = async (id : string) => {
  return execute<Product>(ProductQueries.getProductById, [id]);
}

export const getProductByName = async (name : string) => {
  return execute<Product>(ProductQueries.getProductByName, [name]);
}

export const getBook = async () => {
  return execute<Product>(BookQueries.getBook, []);
}

export const getBookById = async (id : string) => {
  return execute<Product>(BookQueries.getBookById, [id]);
}

export const getStationery = async () => {
  return execute<Product>(StationeryQueries.getStationery, []);
}

export const getStationeryById = async (id : string) => {
  return execute<Product>(StationeryQueries.getStationeryById, [id]);
}