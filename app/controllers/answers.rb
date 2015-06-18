get '/answers/:answer_id/best' do
  this_user = User.find_by(id: session[:user_id])
  this_answer = Answer.find_by(id: params[:answer_id])
  this_question = this_answer.question
  if this_user && this_question.user == this_user && this_question.best_answer_id == nil
    this_question.best_answer_id = this_answer.id
    this_question.save
    redirect "/questions/#{this_question.id}"
  else
    @errors = "You need to be logged in to do that"
    @questions = Question.all
    erb :index
  end
end

post '/questions/:question_id/answers' do
  if session[:user_id]
    @question = Question.find_by(id: params[:question_id])
    user = User.find_by(id: session[:user_id])
    new_answer = Answer.create(body: params[:body])
    @question.answers << new_answer
    user.answers << new_answer
    redirect "/questions/#{@question.id}"
  else
    @errors = "You must be logged in to do that"
    @questions = Question.all
    erb :index
  end
end
