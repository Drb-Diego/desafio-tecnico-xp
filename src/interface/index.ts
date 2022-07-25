export interface ILogin {
  email: string;
  password: string
}

export interface IUserJwt extends ILogin {
  id: number
}
