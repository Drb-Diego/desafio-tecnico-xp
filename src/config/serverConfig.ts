import express from 'express';
import 'dotenv/config';

export default () => {
  const app = express();

  app.use(express.json());

  return app;
};
