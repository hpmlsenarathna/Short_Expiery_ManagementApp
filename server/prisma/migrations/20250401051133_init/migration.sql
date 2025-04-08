/*
  Warnings:

  - The primary key for the `orders` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `orders` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `orders` table. All the data in the column will be lost.
  - The primary key for the `products` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `expiryDate` on the `products` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `products` table. All the data in the column will be lost.
  - The primary key for the `released` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `released` table. All the data in the column will be lost.
  - You are about to drop the column `orderId` on the `released` table. All the data in the column will be lost.
  - The primary key for the `releasedByCategory` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `releasedByCategory` table. All the data in the column will be lost.
  - You are about to drop the column `releasedId` on the `releasedByCategory` table. All the data in the column will be lost.
  - The primary key for the `releasedSummary` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `releasedSummary` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `releasedSummary` table. All the data in the column will be lost.
  - You are about to drop the column `releasedId` on the `releasedSummary` table. All the data in the column will be lost.
  - You are about to drop the column `releasedToWard` on the `releasedSummary` table. All the data in the column will be lost.
  - The primary key for the `remainingFullStock` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `remainingFullStock` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `remainingFullStock` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `remainingFullStock` table. All the data in the column will be lost.
  - The primary key for the `stocks` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `stocks` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `stocks` table. All the data in the column will be lost.
  - You are about to drop the column `store` on the `stocks` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `stocks` table. All the data in the column will be lost.
  - You are about to alter the column `totalAmount` on the `stocks` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `Decimal(65,30)`.
  - The primary key for the `users` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `role` on the `users` table. All the data in the column will be lost.
  - You are about to drop the `shortExpiry` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `orderID` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productID` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userID` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ward` to the `orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `expirationDate` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `price` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productID` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderID` to the `released` table without a default value. This is not possible if the table is not empty.
  - Added the required column `releasedID` to the `released` table without a default value. This is not possible if the table is not empty.
  - Added the required column `releasedID` to the `releasedByCategory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productID` to the `releasedSummary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `releaseToWard` to the `releasedSummary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `releasedID` to the `releasedSummary` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productID` to the `remainingFullStock` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productName` to the `remainingFullStock` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ward` to the `remainingFullStock` table without a default value. This is not possible if the table is not empty.
  - Added the required column `category` to the `stocks` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productID` to the `stocks` table without a default value. This is not possible if the table is not empty.
  - Added the required column `stockID` to the `stocks` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userID` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "orders" DROP CONSTRAINT "orders_productId_fkey";

-- DropForeignKey
ALTER TABLE "orders" DROP CONSTRAINT "orders_userId_fkey";

-- DropForeignKey
ALTER TABLE "released" DROP CONSTRAINT "released_orderId_fkey";

-- DropForeignKey
ALTER TABLE "releasedByCategory" DROP CONSTRAINT "releasedByCategory_releasedId_fkey";

-- DropForeignKey
ALTER TABLE "releasedSummary" DROP CONSTRAINT "releasedSummary_productId_fkey";

-- DropForeignKey
ALTER TABLE "releasedSummary" DROP CONSTRAINT "releasedSummary_releasedId_fkey";

-- DropForeignKey
ALTER TABLE "remainingFullStock" DROP CONSTRAINT "remainingFullStock_productId_fkey";

-- DropForeignKey
ALTER TABLE "shortExpiry" DROP CONSTRAINT "shortExpiry_productId_fkey";

-- DropForeignKey
ALTER TABLE "stocks" DROP CONSTRAINT "stocks_productId_fkey";

-- DropForeignKey
ALTER TABLE "stocks" DROP CONSTRAINT "stocks_userId_fkey";

-- AlterTable
ALTER TABLE "orders" DROP CONSTRAINT "orders_pkey",
DROP COLUMN "id",
DROP COLUMN "productId",
DROP COLUMN "userId",
ADD COLUMN     "orderID" TEXT NOT NULL,
ADD COLUMN     "productID" TEXT NOT NULL,
ADD COLUMN     "userID" TEXT NOT NULL,
ADD COLUMN     "ward" TEXT NOT NULL,
ALTER COLUMN "timestamp" DROP DEFAULT,
ADD CONSTRAINT "orders_pkey" PRIMARY KEY ("orderID");

-- AlterTable
ALTER TABLE "products" DROP CONSTRAINT "products_pkey",
DROP COLUMN "expiryDate",
DROP COLUMN "id",
ADD COLUMN     "expirationDate" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "price" DECIMAL(65,30) NOT NULL,
ADD COLUMN     "productID" TEXT NOT NULL,
ADD CONSTRAINT "products_pkey" PRIMARY KEY ("productID");

-- AlterTable
ALTER TABLE "released" DROP CONSTRAINT "released_pkey",
DROP COLUMN "id",
DROP COLUMN "orderId",
ADD COLUMN     "orderID" TEXT NOT NULL,
ADD COLUMN     "releasedID" TEXT NOT NULL,
ALTER COLUMN "timestamp" DROP DEFAULT,
ADD CONSTRAINT "released_pkey" PRIMARY KEY ("releasedID");

-- AlterTable
ALTER TABLE "releasedByCategory" DROP CONSTRAINT "releasedByCategory_pkey",
DROP COLUMN "id",
DROP COLUMN "releasedId",
ADD COLUMN     "releasedID" BIGINT NOT NULL,
ALTER COLUMN "date" DROP DEFAULT,
ADD CONSTRAINT "releasedByCategory_pkey" PRIMARY KEY ("releasedID");

-- AlterTable
ALTER TABLE "releasedSummary" DROP CONSTRAINT "releasedSummary_pkey",
DROP COLUMN "id",
DROP COLUMN "productId",
DROP COLUMN "releasedId",
DROP COLUMN "releasedToWard",
ADD COLUMN     "productID" TEXT NOT NULL,
ADD COLUMN     "releaseToWard" TEXT NOT NULL,
ADD COLUMN     "releasedID" TEXT NOT NULL,
ALTER COLUMN "timestamp" DROP DEFAULT,
ADD CONSTRAINT "releasedSummary_pkey" PRIMARY KEY ("releasedID");

-- AlterTable
ALTER TABLE "remainingFullStock" DROP CONSTRAINT "remainingFullStock_pkey",
DROP COLUMN "id",
DROP COLUMN "name",
DROP COLUMN "productId",
ADD COLUMN     "productID" TEXT NOT NULL,
ADD COLUMN     "productName" TEXT NOT NULL,
ADD COLUMN     "ward" TEXT NOT NULL,
ALTER COLUMN "timestamp" DROP DEFAULT,
ADD CONSTRAINT "remainingFullStock_pkey" PRIMARY KEY ("productID");

-- AlterTable
ALTER TABLE "stocks" DROP CONSTRAINT "stocks_pkey",
DROP COLUMN "id",
DROP COLUMN "productId",
DROP COLUMN "store",
DROP COLUMN "userId",
ADD COLUMN     "category" TEXT NOT NULL,
ADD COLUMN     "productID" TEXT NOT NULL,
ADD COLUMN     "stockID" TEXT NOT NULL,
ALTER COLUMN "timestamp" DROP DEFAULT,
ALTER COLUMN "totalAmount" SET DATA TYPE DECIMAL(65,30),
ADD CONSTRAINT "stocks_pkey" PRIMARY KEY ("stockID");

-- AlterTable
ALTER TABLE "users" DROP CONSTRAINT "users_pkey",
DROP COLUMN "id",
DROP COLUMN "role",
ADD COLUMN     "userID" TEXT NOT NULL,
ADD CONSTRAINT "users_pkey" PRIMARY KEY ("userID");

-- DropTable
DROP TABLE "shortExpiry";

-- CreateTable
CREATE TABLE "shortExpirySummary" (
    "expiryID" TEXT NOT NULL,
    "productID" TEXT NOT NULL,
    "productName" TEXT NOT NULL,
    "expirationDate" TIMESTAMP(3) NOT NULL,
    "ward" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,
    "category" TEXT NOT NULL,

    CONSTRAINT "shortExpirySummary_pkey" PRIMARY KEY ("expiryID")
);

-- AddForeignKey
ALTER TABLE "stocks" ADD CONSTRAINT "stocks_productID_fkey" FOREIGN KEY ("productID") REFERENCES "products"("productID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_userID_fkey" FOREIGN KEY ("userID") REFERENCES "users"("userID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_productID_fkey" FOREIGN KEY ("productID") REFERENCES "products"("productID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "released" ADD CONSTRAINT "released_orderID_fkey" FOREIGN KEY ("orderID") REFERENCES "orders"("orderID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "releasedSummary" ADD CONSTRAINT "releasedSummary_productID_fkey" FOREIGN KEY ("productID") REFERENCES "products"("productID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shortExpirySummary" ADD CONSTRAINT "shortExpirySummary_productID_fkey" FOREIGN KEY ("productID") REFERENCES "products"("productID") ON DELETE RESTRICT ON UPDATE CASCADE;
