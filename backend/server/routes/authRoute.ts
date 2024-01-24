import { Router } from "express";
import { authService } from "../services/authService";

export const authRoute = Router();

authRoute.post('/login', async (req, res) => {
    try {
        // calls the Authentacation Service with the email and password from the request body
        const user = await authService(req.body.email, req.body.password);
        res.status(200).send(user);
    } catch (error) {
        if (error instanceof Error) {
            res.status(401).send(error.message);
        } else {
            // Handle cases where the error is not an instance of Error
        } res.status(500).send('An unknown error occurred');
    }
});