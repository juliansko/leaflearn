import { UserModel } from "../models/userModel";
import sampleUser from "../samples/sampleUser.json";

export const createUser = async () => {
    try {
        const user = new UserModel(sampleUser);
        user.save();
        console.log(user);
    } catch (error) {
        console.log("Error creating sample user: ", error);
    }
};