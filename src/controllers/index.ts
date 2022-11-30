import { Request, Response } from "express";
import path from "path";

/**
 * GET /
 * Home page.
 */
export const index = async (req: Request, res: Response): Promise<void> => {
    res.render("index", { title: "TiniAPI" });
};