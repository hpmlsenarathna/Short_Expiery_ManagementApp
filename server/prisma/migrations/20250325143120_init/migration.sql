-- CreateTable
CREATE TABLE "Users" (
    "userId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "Products" (
    "productId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "expirationDate" TIMESTAMP(3) NOT NULL,
    "stockQuantity" INTEGER NOT NULL,

    CONSTRAINT "Products_pkey" PRIMARY KEY ("productId")
);

-- CreateTable
CREATE TABLE "Orders" (
    "orderId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "orderStatus" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Orders_pkey" PRIMARY KEY ("orderId")
);

-- CreateTable
CREATE TABLE "Released" (
    "releasedId" TEXT NOT NULL,
    "orderId" TEXT NOT NULL,
    "releasedBy" TEXT NOT NULL,
    "receivedBy" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,
    "ward" TEXT NOT NULL,
    "category" TEXT NOT NULL,

    CONSTRAINT "Released_pkey" PRIMARY KEY ("releasedId")
);

-- CreateTable
CREATE TABLE "ReleasedSummary" (
    "releasedSummaryId" TEXT NOT NULL,
    "releasedId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "releasedToWard" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ReleasedSummary_pkey" PRIMARY KEY ("releasedSummaryId")
);

-- CreateTable
CREATE TABLE "ShortExpiry" (
    "expiryId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "productName" TEXT NOT NULL,
    "expirationDate" TIMESTAMP(3) NOT NULL,
    "ward" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,
    "category" TEXT NOT NULL,

    CONSTRAINT "ShortExpiry_pkey" PRIMARY KEY ("expiryId")
);

-- CreateTable
CREATE TABLE "RemainingDrugs" (
    "productId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RemainingDrugs_pkey" PRIMARY KEY ("productId")
);

-- CreateTable
CREATE TABLE "Stocks" (
    "stockId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "productName" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "totalAmount" DOUBLE PRECISION NOT NULL,
    "store" TEXT NOT NULL,

    CONSTRAINT "Stocks_pkey" PRIMARY KEY ("stockId")
);

-- AddForeignKey
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Released" ADD CONSTRAINT "Released_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "Orders"("orderId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReleasedSummary" ADD CONSTRAINT "ReleasedSummary_releasedId_fkey" FOREIGN KEY ("releasedId") REFERENCES "Released"("releasedId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ShortExpiry" ADD CONSTRAINT "ShortExpiry_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RemainingDrugs" ADD CONSTRAINT "RemainingDrugs_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Products"("productId") ON DELETE RESTRICT ON UPDATE CASCADE;
