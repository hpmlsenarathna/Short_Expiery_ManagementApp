import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const getRemainingFullStock = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const search = req.query.search?.toString();
    const remainingFullStock = await prisma.remainingFullStock.findMany({
      where: {
        productName: {
          contains: search,
        },
      },
    });
    res.json(remainingFullStock);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error retrieving remaining full stock" });
  }
};

export const createRemainingFullStock = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const { productId, stockQuantity, productName, category, releasedQuantity, remainingQuantity } = req.body;
    const newStock = await prisma.remainingFullStock.create({
      data: {
        productId,
        stockQuantity,
        productName,
        category,
        releasedQuantity,
        remainingQuantity,
      },
    });
    res.status(201).json(newStock);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error creating remaining full stock" });
  }
};
