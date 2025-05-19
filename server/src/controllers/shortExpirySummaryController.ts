import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const getShortExpirySummary = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const search = req.query.search?.toString();
    const shortExpirySummary = await prisma.shortExpirySummary.findMany({
      where: {
        productName: {
          contains: search,
        },
      },
    });
    res.json(shortExpirySummary);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error retrieving short expiry summary" });
  }
};

export const createShortExpirySummary = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const { productId, productName, category, expirationDate, remainingQuantity } = req.body;
    const newShortExpiry = await prisma.shortExpirySummary.create({
      data: {
        productId,
        productName,
        category,
        expirationDate: new Date(expirationDate), // Ensure DateTime format
        remainingQuantity,
      },
    });
    res.status(201).json(newShortExpiry);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error creating short expiry summary" });
  }
};
