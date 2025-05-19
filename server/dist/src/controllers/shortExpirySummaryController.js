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
exports.createShortExpirySummary = exports.getShortExpirySummary = void 0;
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
const getShortExpirySummary = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    var _a;
    try {
        const search = (_a = req.query.search) === null || _a === void 0 ? void 0 : _a.toString();
        const shortExpirySummary = yield prisma.shortExpirySummary.findMany({
            where: {
                productName: {
                    contains: search,
                },
            },
        });
        res.json(shortExpirySummary);
    }
    catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error retrieving short expiry summary" });
    }
});
exports.getShortExpirySummary = getShortExpirySummary;
const createShortExpirySummary = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const { productId, productName, category, expirationDate, remainingQuantity } = req.body;
        const newShortExpiry = yield prisma.shortExpirySummary.create({
            data: {
                productId,
                productName,
                category,
                expirationDate: new Date(expirationDate), // Ensure DateTime format
                remainingQuantity,
            },
        });
        res.status(201).json(newShortExpiry);
    }
    catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error creating short expiry summary" });
    }
});
exports.createShortExpirySummary = createShortExpirySummary;
