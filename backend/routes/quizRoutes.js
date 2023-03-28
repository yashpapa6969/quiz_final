const express=require('express');
const router=express.Router();
const quizController=require('../controllers/quizController');

router.get('/',quizController.getAllQuizes);
router.post('/',quizController.createQuiz);

module.exports=router;