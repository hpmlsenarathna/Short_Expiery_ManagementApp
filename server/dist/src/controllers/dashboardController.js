"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getDashboardMetrics = void 0;
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
const getDashboardMetrics = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const products = yield prisma.products.findMany({
            take: 5,
            orderBy: { stockQuantity: "desc" },
        });
        const remainingFullStock = yield prisma.remainingFullStock.findMany({
            take: 5,
            orderBy: { productId: "desc" },
        });
        const shortExpirySummary = yield prisma.shortExpirySummary.findMany({
            take: 5,
            orderBy: { productId: "desc" },
        });
        const releasedSummary = yield prisma.releasedSummary.findMany({
            take: 5,
            orderBy: { releasedId: "desc" },
        });
        res.json({
            products,
            remainingFullStock,
            shortExpirySummary,
            releasedSummary,
        });
    }
    catch (error) {
        console.error(error); // <-- also good to log actual error
        res.status(500).json({ message: "Error retrieving dashboard metrics" });
    }
});
exports.getDashboardMetrics = getDashboardMetrics;
