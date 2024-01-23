import { sha256 } from "js-sha256";

import { UserModel } from "../models/userModel";

export async function authUser(email: string, password: string) {
    // Tries to find user with given mail
    const user = await UserModel.findOne({ email: email });
    // Throws error if user not found
    if (!user) {
        throw new Error("User not found");
    }
    // hashes password and compares it to the one in the database
    if (user.password !== sha256(password)) {
        throw new Error("Password incorrect");
    }
    console.log(user);

}
