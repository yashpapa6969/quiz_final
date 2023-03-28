const mongoose = require('mongoose')
const dotenv = require('dotenv')

function ConnectToDb() {
    const url="mongodb+srv://yashguptayg856:SEvysC6qSgLEJjvk@cluster0.x9qq7ag.mongodb.net/test"

  //const url = process.env.MONGODB_URI
  mongoose.set("strictQuery", true);
  mongoose
    .connect(url)
    .then(() => {
      console.log("Connected to the database ");
    })
    .catch((err) => {
      console.error(`Error connecting to the database. n${err}`);
    });
  
}


module.exports = ConnectToDb;