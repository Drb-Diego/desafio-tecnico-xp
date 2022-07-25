import { NextFunction, Request, Response } from 'express';
import statusCode from 'http-status-codes';
import { loginSchema } from '../utils/joiSchemas';

const validateBody = (request: Request, response: Response, next: NextFunction) => {
  const { email, password } = request.body;
  const { error } = loginSchema.validate({ email, password });

  if (error) return response.status(statusCode.BAD_REQUEST).json({ message: error.message });
  next();
};

export default {
  validateBody,
};
