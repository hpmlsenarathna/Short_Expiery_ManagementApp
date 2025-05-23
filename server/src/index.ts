import express from "express";
import dotenv from "dotenv";
import bodyParser from "body-parser";
import cors from "cors";
import helmet from "helmet";
import morgan from "morgan";

/* ROUTE IMPORTS */
import dashboardRoutes from "./routes/dashboardRoutes";
import releasedSummaryRoutes from "./routes/releasedSummaryRoutes";
import remainingFullStockRoutes from "./routes/remainingFullStockRoutes";
import shortExpirySummaryRoutes from "./routes/shortExpirySummaryRoutes";

/* CONFIGURATIONS */
dotenv.config();
const app = express();
app.use(express.json());
app.use(helmet());
app.use(helmet.crossOriginResourcePolicy({ policy: "cross-origin" }));
app.use(morgan("common"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cors());

/* ROUTES */
app.use("/dashboard", dashboardRoutes);     // http://localhost:8000/dashboard
app.use("/releasedSummary", releasedSummaryRoutes);       // http://localhost:8000/releasedSummary
app.use("/remainingFullStock", remainingFullStockRoutes);              // http://localhost:8000/remainingFullStock
app.use("/shortExpirySummary", shortExpirySummaryRoutes);       // http://localhost:8000/shortExpirySummary


/* SERVER */
const port = Number(process.env.PORT) || 8000;
app.listen(port, "0.0.0.0", () => {
  console.log(`Server running on port ${port}`);
});
