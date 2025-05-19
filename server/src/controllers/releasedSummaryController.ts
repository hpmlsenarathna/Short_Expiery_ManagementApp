import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const getReleasedSummary = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const releasedSummaryRaw = await prisma.releasedSummary.findMany({
      orderBy: {
        releasedId: "desc",
      },
    });

    const releasedSummary = releasedSummaryRaw.map((item) => ({
      ...item,
      amount: item.releasedQuantity, // set amount = releasedQuantity
      items: item.productName,       // set items = productName
    }));

    res.json(releasedSummary);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error retrieving released summary" });
  }
};
