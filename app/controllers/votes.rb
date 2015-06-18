get '/questions/:question_id/votes/:value' do
  if session[:user_id]
    this_user = User.find_by(id: session[:user_id])
    this_question = Question.find_by(id: params[:question_id])
    this_vote = Vote.new(value: params[:value])
    if Vote.allowed_to_vote(this_user, this_question)
      this_vote.save
      this_question.votes << this_vote
      this_user.save
      redirect "/questions/#{params[:question_id]}"
    else
      @errors = "You already voted on this issue"
      redirect "/"
    end
  else
    @errors = "You are not logged in"
    redirect "/"
  end
end

get '/answers/:answer_id/votes/:value' do
  if session[:user_id]
    this_user = User.find_by(id: session[:user_id])
    this_answer = Answer.find_by(id: params[:answer_id])
    this_vote = Vote.new(value: params[:value])
    if Vote.allowed_to_vote(this_user, this_answer)
      this_vote.save
      this_answer.votes << this_vote
      redirect "/questions/#{this_answer.question_id}"
    else
      @errors = "You already voted on this issue"
      redirect "/"
    end
  else
    @errors = "You are not logged in"
    redirect "/"
  end
end

