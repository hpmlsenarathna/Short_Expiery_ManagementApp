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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const client_1 = require("@prisma/client");
const fs_1 = __importDefault(require("fs"));
const path_1 = __importDefault(require("path"));
require("dotenv/config");
const prisma = new client_1.PrismaClient();
function deleteAllData(orderedModelNames) {
    return __awaiter(this, void 0, void 0, function* () {
        for (const modelName of orderedModelNames) {
            const model = prisma[modelName];
            if (model) {
                yield model.deleteMany({});
                console.log(`🧹 Cleared data from ${modelName}`);
            }
            else {
                console.error(`❌ Model ${modelName} not found in Prisma Client`);
            }
        }
    });
}
function main() {
    return __awaiter(this, void 0, void 0, function* () {
        const dataDirectory = path_1.default.join(__dirname, "seedData");
        const orderedModels = [
            "users",
            "products",
            "stocks",
            "orders",
            "released",
            "releasedByCategory",
            "remainingFullStock",
            "shortExpirySummary",
            "releasedSummary"
        ];
        // Step 1: Delete all data in reverse dependency order
        yield deleteAllData([...orderedModels].reverse()); // Don't mutate the original array
        // Step 2: Seed data in correct dependency order
        for (const modelName of orderedModels) {
            const filePath = path_1.default.join(dataDirectory, `${modelName}.json`);
            if (!fs_1.default.existsSync(filePath)) {
                console.warn(`⚠️ File not found: ${filePath}`);
                continue;
            }
            const jsonData = JSON.parse(fs_1.default.readFileSync(filePath, "utf-8"));
            const model = prisma[modelName];
            if (!model) {
                console.error(`❌ No Prisma model matches: ${modelName}`);
                continue;
            }
            for (const data of jsonData) {
                try {
                    yield model.create({ data });
                }
                catch (e) {
                    console.error(`❌ Error seeding ${modelName}:`, e);
                }
            }
            console.log(`✅ Seeded ${modelName} from ${modelName}.json`);
        }
    });
}
main()
    .then(() => {
    console.log("🎉 Database seeded successfully");
})
    .catch((e) => {
    console.error("🔥 Seeding failed:", e);
})
    .finally(() => __awaiter(void 0, void 0, void 0, function* () {
    yield prisma.$disconnect();
}));
