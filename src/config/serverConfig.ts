import express from 'express';
import 'dotenv/config';
import loginRoutes from '../routes/login.routes';
import errorMiddleware from '../middleware/error.middleware';

export default () => {
  const app = express();

  app.use(express.json());
  app.use(loginRoutes);

  app.use(errorMiddleware);

  return app;
};
