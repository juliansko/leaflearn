import dotenv from 'dotenv';
import {Schema, model, connect} from 'mongoose';
dotenv.config();

export async function run() {
  await connect(process.env.MONGO_URI!);
  console.log('Connected to MongoDB');
}
