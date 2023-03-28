const mongoose=require('mongoose');
const {Schema} = mongoose;

const QuizSchema= new Schema({
    category:{
        type:String,
        required:true
    },
    difficulty:{
        type:String,
        required:true,
    },

   
        
            question:{
                type:String,
                required:true
            },
        
                    option1:{
                        type:String,
                        required:true
                    },

                    option2:{
                        type:String,
                        required:true
                    }, option3:{
                        type:String,
                        required:true
                    }, option4:{
                        type:String,
                        required:true
                    },
                   
            
            anwser:{
                type:String,
                required:true
            },
            explaination:{
                type:String,
                required:true
            }
            
        
    
});

const Quiz=mongoose.model('Quiz',QuizSchema);

module.exports=Quiz;

