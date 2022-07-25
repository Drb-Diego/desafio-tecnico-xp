import serverConfig from './config/serverConfig';

const PORT = process.env.PORT || 3000;

const app = serverConfig();

app.listen(PORT, () => console.log(`Server up on PORT: ${PORT}`));
