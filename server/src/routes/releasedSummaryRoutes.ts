import { Router } from "express";
import { getReleasedSummary } from "../controllers/releasedSummaryController";

const router = Router();

router.get("/", getReleasedSummary);

export default router;
