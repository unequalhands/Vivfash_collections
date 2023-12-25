import  express  from "express";
import mongoose from "mongoose";
import env  from "dotenv";

//import userRoutes from './routes/userRoutes.js'


// routes
const app = express();





env.config();
mongoose.connect(
    `mongodb+srv://${process.env.MONGO_DB_USER}:${process.env.MONGO_DB_PASS}@cluster1.xinmytt.mongodb.net/${process.env.MONGO_DB_DATAB}?retryWrites=true&w=majority`,
).then(()=>console.log ("Database connected successfully"));

//middlewares
app.use(express.json());
//app.use('/api', userRoutes);





//mongodb+srv://unequalhands:<password>@cluster0.smyynbk.mongodb.net/?retryWrites=true&w=majority


app.listen(process.env.PORT,'0.0.0.0', ()=>{
console.log(`connected successfully at port ${process.env.PORT}`)
})