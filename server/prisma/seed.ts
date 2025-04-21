import { PrismaClient } from "@prisma/client";
import fs from "fs";
import path from "path";
import 'dotenv/config';

const prisma = new PrismaClient();

async function deleteAllData(orderedModelNames: string[]) {
  for (const modelName of orderedModelNames) {
    const model: any = prisma[modelName as keyof typeof prisma];
    if (model) {
      await model.deleteMany({});
      console.log(`🧹 Cleared data from ${modelName}`);
    } else {
      console.error(`❌ Model ${modelName} not found in Prisma Client`);
    }
  }
}

async function main() {
  const dataDirectory = path.join(__dirname, "seedData");

  // ORDER MATTERS: Seed models respecting foreign key constraints
  const orderedModels = [
    "releasedSummary",
    "shortExpirySummary",
    "releasedByCategory",
    "remainingFullStock",
    "stocks",
    "products",
    "orders",
    "released",
    "users"
  ];

  // Step 1: Delete all data (in reverse dependency order)
  await deleteAllData(orderedModels.reverse());

  // Step 2: Seed data (in correct dependency order)
  for (const modelName of orderedModels) {
    const filePath = path.join(dataDirectory, `${modelName}.json`);

    if (!fs.existsSync(filePath)) {
      console.warn(`⚠️ File not found: ${filePath}`);
      continue;
    }

    const jsonData = JSON.parse(fs.readFileSync(filePath, "utf-8"));
    const model: any = prisma[modelName as keyof typeof prisma];

    if (!model) {
      console.error(`❌ No Prisma model matches: ${modelName}`);
      continue;
    }

    for (const data of jsonData) {
      try {
        await model.create({ data });
      } catch (e) {
        console.error(`❌ Error seeding ${modelName}:`, e);
      }
    }

    console.log(`✅ Seeded ${modelName} from ${modelName}.json`);
  }
}

main()
  .then(() => {
    console.log("🎉 Database seeded successfully");
  })
  .catch((e) => {
    console.error("🔥 Seeding failed:", e);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
