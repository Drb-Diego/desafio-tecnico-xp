import { NextFunction, Request, Response } from 'express';
import statusCode from 'http-status-codes';
import loginService from '../service/login.service';

const create = async (request: Request, response: Response, next: NextFunction) => {
  try {
    const { email, password } = request.body;

    const token = await loginService.create({ email, password: password.toString() });

    return response.status(statusCode.OK).json(token);
  } catch (err) {
    next(err);
  }
};

const login = async (request: Request, response: Response, next: NextFunction) => {
  try {
    const { email, password } = request.body;

    const token = await loginService.login({ email, password: password.toString() });

    return response.status(statusCode.CREATED).json(token);
  } catch (err) {
    next(err);
  }
};

export default {
  create,
  login,
};
