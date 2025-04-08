/*
  Warnings:

  - You are about to drop the `Orders` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Products` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Released` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ReleasedSummary` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RemainingDrugs` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ShortExpiry` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Stocks` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Orders" DROP CONSTRAINT "Orders_productId_fkey";

-- DropForeignKey
ALTER TABLE "Released" DROP CONSTRAINT "Released_orderId_fkey";

-- DropForeignKey
ALTER TABLE "ReleasedSummary" DROP CONSTRAINT "ReleasedSummary_releasedId_fkey";

-- DropForeignKey
ALTER TABLE "RemainingDrugs" DROP CONSTRAINT "RemainingDrugs_productId_fkey";

-- DropForeignKey
ALTER TABLE "ShortExpiry" DROP CONSTRAINT "ShortExpiry_productId_fkey";

-- DropTable
DROP TABLE "Orders";

-- DropTable
DROP TABLE "Products";

-- DropTable
DROP TABLE "Released";

-- DropTable
DROP TABLE "ReleasedSummary";

-- DropTable
DROP TABLE "RemainingDrugs";

-- DropTable
DROP TABLE "ShortExpiry";

-- DropTable
DROP TABLE "Stocks";

-- DropTable
DROP TABLE "Users";

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "expiryDate" TIMESTAMP(3) NOT NULL,
    "stockQuantity" INTEGER NOT NULL,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "orders" (
    "id" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "orderStatus" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT,

    CONSTRAINT "orders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "released" (
    "id" TEXT NOT NULL,
    "orderId" TEXT NOT NULL,
    "releasedBy" TEXT NOT NULL,
    "receivedBy" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ward" TEXT NOT NULL,
    "category" TEXT NOT NULL,

    CONSTRAINT "released_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "releasedByCategory" (
    "id" TEXT NOT NULL,
    "releasedId" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "category" TEXT NOT NULL,

    CONSTRAINT "releasedByCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "releasedSummary" (
    "id" TEXT NOT NULL,
    "releasedId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "releasedToWard" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "releasedSummary_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "shortExpiry" (
    "id" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "productName" TEXT NOT NULL,
    "expirationDate" TIMESTAMP(3) NOT NULL,
    "ward" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "category" TEXT NOT NULL,

    CONSTRAINT "shortExpiry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "remainingFullStock" (
    "id" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "remainingFullStock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stocks" (
    "id" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "productName" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "quantity" INTEGER NOT NULL,
    "totalAmount" DOUBLE PRECISION NOT NULL,
    "store" TEXT NOT NULL,
    "userId" TEXT,

    CONSTRAINT "stocks_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "released" ADD CONSTRAINT "released_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "orders"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "releasedByCategory" ADD CONSTRAINT "releasedByCategory_releasedId_fkey" FOREIGN KEY ("releasedId") REFERENCES "released"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "releasedSummary" ADD CONSTRAINT "releasedSummary_releasedId_fkey" FOREIGN KEY ("releasedId") REFERENCES "released"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "releasedSummary" ADD CONSTRAINT "releasedSummary_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "shortExpiry" ADD CONSTRAINT "shortExpiry_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "remainingFullStock" ADD CONSTRAINT "remainingFullStock_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocks" ADD CONSTRAINT "stocks_productId_fkey" FOREIGN KEY ("productId") REFERENCES "products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stocks" ADD CONSTRAINT "stocks_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;
