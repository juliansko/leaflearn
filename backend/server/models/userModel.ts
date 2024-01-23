import { Schema, model } from "mongoose";

const userSchema = new Schema({
    firstName: { type: String, required: true },
    lastName: { type: String, required: true },
    birthDate: { type: Date, required: true },
    email: { type: String, required: true },
    gender: { type: String, required: true },
    password: { type: String, required: true },
    experience: {type: Number, required: true},
    role: {type: String, required: true},
    avatar: {type: String},
});

export const UserModel = model('User', userSchema);