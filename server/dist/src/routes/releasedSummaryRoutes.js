"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const releasedSummaryController_1 = require("../controllers/releasedSummaryController");
const router = (0, express_1.Router)();
router.get("/", releasedSummaryController_1.getReleasedSummary);
exports.default = router;
