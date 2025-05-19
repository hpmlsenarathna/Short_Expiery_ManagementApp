"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const remainingFullStockController_1 = require("../controllers/remainingFullStockController");
const router = (0, express_1.Router)();
router.get("/", remainingFullStockController_1.getRemainingFullStock);
router.post("/", remainingFullStockController_1.createRemainingFullStock);
exports.default = router;
