import { Router } from "express";
import { createRemainingFullStock, getRemainingFullStock } from "../controllers/remainingFullStockController";

const router = Router();

router.get("/", getRemainingFullStock);
router.post("/", createRemainingFullStock);

export default router;
