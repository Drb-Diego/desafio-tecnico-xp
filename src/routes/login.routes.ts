import { Router } from 'express';
import loginController from '../controller/login.controller';
import validateLogin from '../middleware/login.middlewares';

const routes = Router();

routes.post('/login/cadastrar', validateLogin.validateBody, loginController.create);
routes.post('/login', validateLogin.validateBody, loginController.login);

export default routes;
