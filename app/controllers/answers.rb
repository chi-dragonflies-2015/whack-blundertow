get '/answers/:answer_id/best' do
  this_user = User.find(session[:user_id])
  this_answer = Answer.find(params[:answer_id])
  this_question = this_answer.question
  if this_user && this_question.user == this_user && this_question.best_answer_id == nil
    puts "question_id #{this_question.id}, answer_id #{this_answer.id}"
    this_question.best_answer_id = this_answer.id
    this_question.save
    puts "best answer id #{this_question.best_answer_id}"
    redirect "/questions/#{this_question.id}"
  else
    @errors = "This action is not allowed"
    redirect "/index"
  end
end

post '/questions/:question_id/answers' do
  if session[:user_id]
    @question = Question.find_by(id: params[:question_id])
    @question.answers << Answer.create(body: params[:body])
    redirect "/questions/#{@question.id}"
  else
    @errors = "You must be logged in to do that"
    @questions = Question.all
    erb :index
  end
end
