import bcrypt from 'bcrypt';
import { ILogin } from '../interface';
import loginModel from '../model/login.model';
import jwt from '../utils/token';

const create = async ({ email, password }: ILogin) => {
  const custumerExists = await loginModel.findByEmail(email);

  if (custumerExists) throw new Error('user already exists');

  const encodedPassword = await bcrypt.hash(password, 3);

  const custumerCreated = await loginModel.create({ email, password: encodedPassword });

  const token = jwt.encoded(custumerCreated);

  return {
    token,
  };
};

export default {
  create,
};
