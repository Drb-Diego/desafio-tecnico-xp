import connection from '../database/connection';
import { ILogin } from '../interface';

const findByEmail = async (email: string) => (
  connection.customer.findFirst({ where: { email } })
);

const getAll = async () => (
  connection.customer.findMany()
);

const create = async ({ email, password }: ILogin) => (
  connection.customer.create({ data: { email, password } })
);

export default {
  findByEmail,
  getAll,
  create,
};
