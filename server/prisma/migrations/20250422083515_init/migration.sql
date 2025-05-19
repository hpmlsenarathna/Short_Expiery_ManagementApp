/*
  Warnings:

  - You are about to drop the column `productId` on the `Released` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[releasedId]` on the table `Released` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Released" DROP CONSTRAINT "Released_productId_fkey";

-- DropIndex
DROP INDEX "Stocks_productId_key";

-- AlterTable
ALTER TABLE "Released" DROP COLUMN "productId";

-- CreateIndex
CREATE UNIQUE INDEX "Released_releasedId_key" ON "Released"("releasedId");
