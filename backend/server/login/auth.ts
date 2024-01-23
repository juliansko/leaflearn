import { sha256 } from "js-sha256";

import { UserModel } from "../models/userModel";

export async function authUser(email: string, password: string) {
    const user = await UserModel.findOne({ email: email });
    if (!user) {
        throw new Error("User not found");
    }
    if (user.password !== sha256(password)) {
        throw new Error("Password incorrect");
    }
    console.log(user);

}
