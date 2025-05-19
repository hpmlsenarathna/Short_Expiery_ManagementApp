import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const getDashboardMetrics = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const products = await prisma.products.findMany({
      take: 5,
      orderBy: { stockQuantity: "desc" },
    });

    const remainingFullStock = await prisma.remainingFullStock.findMany({
      take: 5,
      orderBy: { productId: "desc" },
    });

    const shortExpirySummary = await prisma.shortExpirySummary.findMany({
      take: 5,
      orderBy: { productId: "desc" },
    });

    const releasedSummary = await prisma.releasedSummary.findMany({
      take: 5,
      orderBy: { releasedId: "desc" },
    });

    res.json({
      products,
      remainingFullStock,
      shortExpirySummary,
      releasedSummary,
    });
  } catch (error) {
    console.error(error); // <-- also good to log actual error
    res.status(500).json({ message: "Error retrieving dashboard metrics" });
  }
};
