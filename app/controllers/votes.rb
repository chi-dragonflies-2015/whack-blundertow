get '/questions/:question_id/votes/:value' do
  if session[:user_id]
    this_user = User.find_by(id: session[:user_id])
    this_question = Question.find_by(params[:question_id])
    this_vote = Vote.new(value: params[:value])
    if Vote.allowed_to_vote(this_user, this_question)
      this_vote.create
      this_user.votes << this_vote
    else
      @errors = "You already voted on this issue"
      redirect "/"
    end
  else
    @errors = "You are not logged in"
    redirect "/"
  end
end

get '/answer/:answer_id/votes/:value' do
  if session[:user_id]
    this_user = User.find_by(id: session[:user_id])
    this_answer = Question.find_by(params[:question_id])
    this_vote = Vote.new(value: params[:value])
    if Vote.allowed_to_vote(this_user, this_answer)
      this_vote.create
      this_user.votes << this_vote
    else
      @errors = "You already voted on this issue"
      redirect "/"
    end
  else
    @errors = "You are not logged in"
    redirect "/"
  end
end

