import { Router } from "express";
import { createShortExpirySummary, getShortExpirySummary } from "../controllers/shortExpirySummaryController";

const router = Router();

router.get("/", getShortExpirySummary);
router.post("/", createShortExpirySummary);

export default router;
