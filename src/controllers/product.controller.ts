import { Request, RequestHandler, Response } from "express"
import * as ProductService from '../services/product.service';

export const getProduct: RequestHandler = async (req: Request, res: Response) => {
  try {
    const products = await (await ProductService.getProduct()).rows;

    res.status(200).json(
      products
    );
  } catch (error) {
    console.error('[product.controller][getProduct][Error] ', typeof error === 'object' ? JSON.stringify(error) : error);
    res.status(500).json({
      message: 'There was an error when fetching product'
    });
  }
}

export const getProductById: RequestHandler = async (req: Request, res: Response) => {
  try {
    const products = await (await ProductService.getProductById(req.params.id)).rows[0];

    res.status(200).json(
      products
    );
  } catch (error) {
    console.error('[product.controller][getProduct][Error] ', typeof error === 'object' ? JSON.stringify(error) : error);
    res.status(500).json({
      message: 'There was an error when fetching product'
    });
  }
}

export const getProductByName: RequestHandler = async (req: Request, res: Response) => {
  try {
    const products = await (await ProductService.getProductById(req.params.name)).rows;

    res.status(200).json(
      products
    );
  } catch (error) {
    console.error('[product.controller][getProduct][Error] ', typeof error === 'object' ? JSON.stringify(error) : error);
    res.status(500).json({
      message: 'There was an error when fetching product'
    });
  }
}

export const getBook: RequestHandler = async (req: Request, res: Response) => {
  try {
    const products = await (await ProductService.getBook()).rows;

    res.status(200).json(
      products
    );
  } catch (error) {
    console.error('[product.controller][getProduct][Error] ', typeof error === 'object' ? JSON.stringify(error) : error);
    res.status(500).json({
      message: 'There was an error when fetching product'
    });
  }
}

export const getBookById: RequestHandler = async (req: Request, res: Response) => {
  try {
    const products = await (await ProductService.getBookById(req.params.id)).rows[0];

    res.status(200).json(
      products
    );
  } catch (error) {
    console.error('[product.controller][getProduct][Error] ', typeof error === 'object' ? JSON.stringify(error) : error);
    res.status(500).json({
      message: 'There was an error when fetching product'
    });
  }
}

export const getStationery: RequestHandler = async (req: Request, res: Response) => {
  try {
    const products = await (await ProductService.getStationery()).rows;

    res.status(200).json(
      products
    );
  } catch (error) {
    console.error('[product.controller][getProduct][Error] ', typeof error === 'object' ? JSON.stringify(error) : error);
    res.status(500).json({
      message: 'There was an error when fetching product'
    });
  }
}

export const getStationeryById: RequestHandler = async (req: Request, res: Response) => {
  try {
    const products = await (await ProductService.getStationeryById(req.params.id)).rows[0];

    res.status(200).json(
      products
    );
  } catch (error) {
    console.error('[product.controller][getProduct][Error] ', typeof error === 'object' ? JSON.stringify(error) : error);
    res.status(500).json({
      message: 'There was an error when fetching product'
    });
  }
}