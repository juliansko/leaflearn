import express from 'express';
import {connectToMongo} from './services/connectService';
import { authUser } from './services/authService';
import { routes } from './routes';

const app = express();

// gets port either from environment variable or sets it to 3000 if not found
const port = process.env.PORT || 3000;

// imports all routes from routes/index.ts
app.use('/', routes);

// starts server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
    // connects to MongoDB
    connectToMongo().catch(err => console.log(err));
  });
  