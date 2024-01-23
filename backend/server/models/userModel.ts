import { Schema, model } from "mongoose";

// define enum for gender and role so no "wrong" values can be used
enum gender {
    male = "male",
    female = "female",
    other = "other"
}

enum role {
    user = "user",
    admin = "admin"

}

// defines the schema for the user collection, this is for the typescript side
export interface UserInterface {
    firstName: string;
    lastName: string;
    birthDate: String;
    email: string;
    gender: gender;
    password: string;
    experience: number;
    role: role;
    avatar?: string;
}

// defines the schema for the user collection, this is how a user should look like in the database
const userSchema = new Schema<UserInterface>({
    firstName: { type: String, required: true },
    lastName: { type: String, required: true },
    birthDate: { type: Date, required: true },
    email: { type: String, required: true },
    gender: { type: String, enum: ["male", "female", "other"], required: true },
    password: { type: String, required: true },
    experience: { type: Number, required: true },
    role: { type: String, enum: ["user", "admin"], required: true },
    avatar: { type: String },
});

export const UserModel = model('User', userSchema);