import { NextFunction, Request, Response } from 'express';

const errorMiddleware = (
  error: Error,
  _resquest: Request,
  response: Response,
  // eslint-disable-next-line no-unused-vars
  _next: NextFunction,
) => response.status(500).send({ error: error.message });

export default errorMiddleware;
