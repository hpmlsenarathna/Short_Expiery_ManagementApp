/*
  Warnings:

  - You are about to drop the column `orderDate` on the `Orders` table. All the data in the column will be lost.
  - You are about to drop the column `quantity` on the `Orders` table. All the data in the column will be lost.
  - The primary key for the `Products` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `category` on the `Products` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `Products` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Products` table. All the data in the column will be lost.
  - You are about to drop the column `price` on the `Products` table. All the data in the column will be lost.
  - You are about to drop the column `shortExpiry` on the `Products` table. All the data in the column will be lost.
  - The primary key for the `Released` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Released` table. All the data in the column will be lost.
  - You are about to drop the column `quantity` on the `Released` table. All the data in the column will be lost.
  - You are about to drop the column `releasedAt` on the `Released` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Released` table. All the data in the column will be lost.
  - You are about to drop the column `quantity` on the `ReleasedByCategory` table. All the data in the column will be lost.
  - You are about to drop the column `date` on the `ReleasedSummary` table. All the data in the column will be lost.
  - You are about to drop the column `totalReleased` on the `ReleasedSummary` table. All the data in the column will be lost.
  - You are about to drop the column `quantity` on the `RemainingFullStock` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `RemainingFullStock` table. All the data in the column will be lost.
  - You are about to drop the column `expiryDate` on the `ShortExpirySummary` table. All the data in the column will be lost.
  - You are about to drop the column `remainingDays` on the `ShortExpirySummary` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Stocks` table. All the data in the column will be lost.
  - You are about to drop the column `quantity` on the `Stocks` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Stocks` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Stocks` table. All the data in the column will be lost.
  - Added the required column `productName` to the `Orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stockQuantity` to the `Orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `timestamp` to the `Orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ward` to the `Orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `drugName` to the `Products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `drugType` to the `Products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mainTypeOfDrug` to the `Products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productId` to the `Products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stockQuantity` to the `Products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `category` to the `Released` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productName` to the `Released` table without a default value. This is not possible if the table is not empty.
  - Added the required column `releaseDate` to the `Released` table without a default value. This is not possible if the table is not empty.
  - The required column `releaseId` was added to the `Released` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `releasedQuantity` to the `Released` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ward` to the `Released` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productName` to the `ReleasedByCategory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `releasedId` to the `ReleasedByCategory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `category` to the `ReleasedSummary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productName` to the `ReleasedSummary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `releasedId` to the `ReleasedSummary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `releasedQuantity` to the `ReleasedSummary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stockQuantity` to the `ReleasedSummary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ward` to the `ReleasedSummary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `category` to the `RemainingFullStock` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productName` to the `RemainingFullStock` table without a default value. This is not possible if the table is not empty.
  - Added the required column `releasedQuantity` to the `RemainingFullStock` table without a default value. This is not possible if the table is not empty.
  - Added the required column `remainingQuantity` to the `RemainingFullStock` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stockQuantity` to the `RemainingFullStock` table without a default value. This is not possible if the table is not empty.
  - Added the required column `category` to the `ShortExpirySummary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `expirationDate` to the `ShortExpirySummary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productName` to the `ShortExpirySummary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `remainingQuantity` to the `ShortExpirySummary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `category` to the `Stocks` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productName` to the `Stocks` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stockQuantity` to the `Stocks` table without a default value. This is not possible if the table is not empty.
  - Added the required column `timestamp` to the `Stocks` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Orders" DROP CONSTRAINT "Orders_productId_fkey";

-- DropForeignKey
ALTER TABLE "Released" DROP CONSTRAINT "Released_productId_fkey";

-- DropForeignKey
ALTER TABLE "Released" DROP CONSTRAINT "Released_userId_fkey";

-- DropForeignKey
ALTER TABLE "RemainingFullStock" DROP CONSTRAINT "RemainingFullStock_productId_fkey";

-- DropForeignKey
ALTER TABLE "ShortExpirySummary" DROP CONSTRAINT "ShortExpirySummary_productId_fkey";

-- DropForeignKey
ALTER TABLE "Stocks" DROP CONSTRAINT "Stocks_productId_fkey";

-- DropForeignKey
ALTER TABLE "Stocks" DROP CONSTRAINT "Stocks_userId_fkey";

-- AlterTable
ALTER TABLE "Orders" DROP COLUMN "orderDate",
DROP COLUMN "quantity",
ADD COLUMN     "productName" TEXT NOT NULL,
ADD COLUMN     "stockQuantity" INTEGER NOT NULL,
ADD COLUMN     "timestamp" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "ward" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Products" DROP CONSTRAINT "Products_pkey",
DROP COLUMN "category",
DROP COLUMN "id",
DROP COLUMN "name",
DROP COLUMN "price",
DROP COLUMN "shortExpiry",
ADD COLUMN     "drugName" TEXT NOT NULL,
ADD COLUMN     "drugType" TEXT NOT NULL,
ADD COLUMN     "mainTypeOfDrug" TEXT NOT NULL,
ADD COLUMN     "productId" TEXT NOT NULL,
ADD COLUMN     "stockQuantity" INTEGER NOT NULL,
ADD CONSTRAINT "Products_pkey" PRIMARY KEY ("productId");

-- AlterTable
ALTER TABLE "Released" DROP CONSTRAINT "Released_pkey",
DROP COLUMN "id",
DROP COLUMN "quantity",
DROP COLUMN "releasedAt",
DROP COLUMN "userId",
ADD COLUMN     "category" TEXT NOT NULL,
ADD COLUMN     "productName" TEXT NOT NULL,
ADD COLUMN     "releaseDate" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "releaseId" TEXT NOT NULL,
ADD COLUMN     "releasedQuantity" INTEGER NOT NULL,
ADD COLUMN     "ward" INTEGER NOT NULL,
ADD CONSTRAINT "Released_pkey" PRIMARY KEY ("releaseId");

-- AlterTable
ALTER TABLE "ReleasedByCategory" DROP COLUMN "quantity",
ADD COLUMN     "productName" TEXT NOT NULL,
ADD COLUMN     "releasedId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "ReleasedSummary" DROP COLUMN "date",
DROP COLUMN "totalReleased",
ADD COLUMN     "category" TEXT NOT NULL,
ADD COLUMN     "productName" TEXT NOT NULL,
ADD COLUMN     "releasedId" TEXT NOT NULL,
ADD COLUMN     "releasedQuantity" INTEGER NOT NULL,
ADD COLUMN     "stockQuantity" INTEGER NOT NULL,
ADD COLUMN     "ward" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "RemainingFullStock" DROP COLUMN "quantity",
DROP COLUMN "updatedAt",
ADD COLUMN     "category" TEXT NOT NULL,
ADD COLUMN     "productName" TEXT NOT NULL,
ADD COLUMN     "releasedQuantity" INTEGER NOT NULL,
ADD COLUMN     "remainingQuantity" INTEGER NOT NULL,
ADD COLUMN     "stockQuantity" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "ShortExpirySummary" DROP COLUMN "expiryDate",
DROP COLUMN "remainingDays",
ADD COLUMN     "category" TEXT NOT NULL,
ADD COLUMN     "expirationDate" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "productName" TEXT NOT NULL,
ADD COLUMN     "remainingQuantity" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Stocks" DROP COLUMN "createdAt",
DROP COLUMN "quantity",
DROP COLUMN "updatedAt",
DROP COLUMN "userId",
ADD COLUMN     "category" TEXT NOT NULL,
ADD COLUMN     "productName" TEXT NOT NULL,
ADD COLUMN     "stockQuantity" INTEGER NOT NULL,
ADD COLUMN     "timestamp" TIMESTAMP(3) NOT NULL;

-- CreateTable
CREATE TABLE "_ReleasedToReleasedByCategory" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ReleasedToReleasedByCategory_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_ReleasedToReleasedSummary" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ReleasedToReleasedSummary_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_ReleasedToRemainingFullStock" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ReleasedToRemainingFullStock_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_RemainingFullStockToStocks" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_RemainingFullStockToStocks_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_RemainingFullStockToShortExpirySummary" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_RemainingFullStockToShortExpirySummary_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_ReleasedSummaryToRemainingFullStock" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_ReleasedSummaryToRemainingFullStock_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_ReleasedToReleasedByCategory_B_index" ON "_ReleasedToReleasedByCategory"("B");

-- CreateIndex
CREATE INDEX "_ReleasedToReleasedSummary_B_index" ON "_ReleasedToReleasedSummary"("B");

-- CreateIndex
CREATE INDEX "_ReleasedToRemainingFullStock_B_index" ON "_ReleasedToRemainingFullStock"("B");

-- CreateIndex
CREATE INDEX "_RemainingFullStockToStocks_B_index" ON "_RemainingFullStockToStocks"("B");

-- CreateIndex
CREATE INDEX "_RemainingFullStockToShortExpirySummary_B_index" ON "_RemainingFullStockToShortExpirySummary"("B");

-- CreateIndex
CREATE INDEX "_ReleasedSummaryToRemainingFullStock_B_index" ON "_ReleasedSummaryToRemainingFullStock"("B");

-- AddForeignKey
ALTER TABLE "Stocks" ADD CONSTRAINT "Stocks_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Released" ADD CONSTRAINT "Released_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RemainingFullStock" ADD CONSTRAINT "RemainingFullStock_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShortExpirySummary" ADD CONSTRAINT "ShortExpirySummary_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReleasedToReleasedByCategory" ADD CONSTRAINT "_ReleasedToReleasedByCategory_A_fkey" FOREIGN KEY ("A") REFERENCES "Released"("releaseId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReleasedToReleasedByCategory" ADD CONSTRAINT "_ReleasedToReleasedByCategory_B_fkey" FOREIGN KEY ("B") REFERENCES "ReleasedByCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReleasedToReleasedSummary" ADD CONSTRAINT "_ReleasedToReleasedSummary_A_fkey" FOREIGN KEY ("A") REFERENCES "Released"("releaseId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReleasedToReleasedSummary" ADD CONSTRAINT "_ReleasedToReleasedSummary_B_fkey" FOREIGN KEY ("B") REFERENCES "ReleasedSummary"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReleasedToRemainingFullStock" ADD CONSTRAINT "_ReleasedToRemainingFullStock_A_fkey" FOREIGN KEY ("A") REFERENCES "Released"("releaseId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReleasedToRemainingFullStock" ADD CONSTRAINT "_ReleasedToRemainingFullStock_B_fkey" FOREIGN KEY ("B") REFERENCES "RemainingFullStock"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RemainingFullStockToStocks" ADD CONSTRAINT "_RemainingFullStockToStocks_A_fkey" FOREIGN KEY ("A") REFERENCES "RemainingFullStock"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RemainingFullStockToStocks" ADD CONSTRAINT "_RemainingFullStockToStocks_B_fkey" FOREIGN KEY ("B") REFERENCES "Stocks"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RemainingFullStockToShortExpirySummary" ADD CONSTRAINT "_RemainingFullStockToShortExpirySummary_A_fkey" FOREIGN KEY ("A") REFERENCES "RemainingFullStock"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RemainingFullStockToShortExpirySummary" ADD CONSTRAINT "_RemainingFullStockToShortExpirySummary_B_fkey" FOREIGN KEY ("B") REFERENCES "ShortExpirySummary"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReleasedSummaryToRemainingFullStock" ADD CONSTRAINT "_ReleasedSummaryToRemainingFullStock_A_fkey" FOREIGN KEY ("A") REFERENCES "ReleasedSummary"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ReleasedSummaryToRemainingFullStock" ADD CONSTRAINT "_ReleasedSummaryToRemainingFullStock_B_fkey" FOREIGN KEY ("B") REFERENCES "RemainingFullStock"("id") ON DELETE CASCADE ON UPDATE CASCADE;
