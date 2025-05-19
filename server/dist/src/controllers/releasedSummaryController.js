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
exports.getReleasedSummary = void 0;
const client_1 = require("@prisma/client");
const prisma = new client_1.PrismaClient();
const getReleasedSummary = (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        const releasedSummaryRaw = yield prisma.releasedSummary.findMany({
            orderBy: {
                releasedId: "desc",
            },
        });
        const releasedSummary = releasedSummaryRaw.map((item) => (Object.assign(Object.assign({}, item), { amount: item.releasedQuantity, items: item.productName })));
        res.json(releasedSummary);
    }
    catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error retrieving released summary" });
    }
});
exports.getReleasedSummary = getReleasedSummary;
