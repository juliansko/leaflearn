import express from 'express';
import { defaultRoute } from './defaultRoute';

export const routes = express.Router();

// collects all routes and exports them
routes.use(defaultRoute);