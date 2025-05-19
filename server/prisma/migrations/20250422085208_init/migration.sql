/*
  Warnings:

  - You are about to drop the column `productName` on the `Stocks` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[productId]` on the table `Stocks` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `drugName` to the `Stocks` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "ShortExpirySummary" DROP CONSTRAINT "ShortExpirySummary_productId_fkey";

-- AlterTable
ALTER TABLE "Stocks" DROP COLUMN "productName",
ADD COLUMN     "drugName" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Stocks_productId_key" ON "Stocks"("productId");
