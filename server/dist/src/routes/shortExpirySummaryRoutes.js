"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const shortExpirySummaryController_1 = require("../controllers/shortExpirySummaryController");
const router = (0, express_1.Router)();
router.get("/", shortExpirySummaryController_1.getShortExpirySummary);
router.post("/", shortExpirySummaryController_1.createShortExpirySummary);
exports.default = router;
