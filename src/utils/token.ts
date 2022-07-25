import jwt from 'jsonwebtoken';
import { IUserJwt } from '../interface';

const { SECRET } = process.env;

const encoded = (user: IUserJwt) => {
  if (SECRET) {
    const token = jwt.sign({ ...user }, SECRET);
    return token;
  }
};

export default {
  encoded,
};
