import express, {Request, Response} from 'express';
import {run} from './services/connectService';
import { authUser } from './login/auth';

const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req: Request, res: Response) => {
    res.send('Hello, TypeScript Express!');
  });
  
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
    run().catch(err => console.log(err));
    authUser("john@smith.com", "test1234").catch(err => console.log(err));
  });
  