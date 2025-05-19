/*
  Warnings:

  - The primary key for the `Released` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `releaseId` on the `Released` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[productId]` on the table `Orders` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[productId]` on the table `Stocks` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[userId]` on the table `Users` will be added. If there are existing duplicate values, this will fail.
  - The required column `id` was added to the `Released` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `releasedId` to the `Released` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "RemainingFullStock" DROP CONSTRAINT "RemainingFullStock_productId_fkey";

-- DropForeignKey
ALTER TABLE "_ReleasedToReleasedByCategory" DROP CONSTRAINT "_ReleasedToReleasedByCategory_A_fkey";

-- DropForeignKey
ALTER TABLE "_ReleasedToReleasedSummary" DROP CONSTRAINT "_ReleasedToReleasedSummary_A_fkey";

-- DropForeignKey
ALTER TABLE "_ReleasedToRemainingFullStock" DROP CONSTRAINT "_ReleasedToRemainingFullStock_A_fkey";

-- DropIndex
DROP INDEX "RemainingFullStock_productId_key";

-- AlterTable
ALTER TABLE "Released" DROP CONSTRAINT "Released_pkey",
DROP COLUMN "releaseId",
ADD COLUMN     "id" TEXT NOT NULL,
ADD COLUMN     "releasedId" TEXT NOT NULL,
ADD CONSTRAINT "Released_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Users" ADD COLUMN     "userId" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "_ProductsToRemainingFullStock" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ProductsToRemainingFullStock_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_ProductsToRemainingFullStock_B_index" ON "_ProductsToRemainingFullStock"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Orders_productId_key" ON "Orders"("productId");

-- CreateIndex
CREATE UNIQUE INDEX "Stocks_productId_key" ON "Stocks"("productId");

-- CreateIndex
CREATE UNIQUE INDEX "Users_userId_key" ON "Users"("userId");

-- AddForeignKey
ALTER TABLE "_ProductsToRemainingFullStock" ADD CONSTRAINT "_ProductsToRemainingFullStock_A_fkey" FOREIGN KEY ("A") REFERENCES "Products"("productId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProductsToRemainingFullStock" ADD CONSTRAINT "_ProductsToRemainingFullStock_B_fkey" FOREIGN KEY ("B") REFERENCES "RemainingFullStock"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReleasedToReleasedByCategory" ADD CONSTRAINT "_ReleasedToReleasedByCategory_A_fkey" FOREIGN KEY ("A") REFERENCES "Released"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReleasedToReleasedSummary" ADD CONSTRAINT "_ReleasedToReleasedSummary_A_fkey" FOREIGN KEY ("A") REFERENCES "Released"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReleasedToRemainingFullStock" ADD CONSTRAINT "_ReleasedToRemainingFullStock_A_fkey" FOREIGN KEY ("A") REFERENCES "Released"("id") ON DELETE CASCADE ON UPDATE CASCADE;
