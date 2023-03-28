const Quiz=require('../models/quiz');

const getAllQuizes=async(req,res)=>{
    try{
        const quizzes=await Quiz.find();
        console.log(quizzes);
        res.status(200).json(quizzes);
    }catch(error){
        console.error(error);
        res.send(500).json({
            status:'Server error'
        })
    }
};

const createQuiz=async(req,res)=>{
    try{
        const quiz=new Quiz(req.body);
        await quiz.save();
        res.status(200).json({
            status:'Quiz created successfullly'
        })
    }catch(err){
        res.send(400).json(
            {
                error:err.message,
            }
        )
    }
}

module.exports={
    getAllQuizes,
    createQuiz,
};