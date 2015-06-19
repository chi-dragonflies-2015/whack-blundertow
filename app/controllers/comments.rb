get '/comments/new' do
  #ajax call for comment form
end

post '/questions/:question_id/comments' do
  if session[:user_id]
    this_user = User.find_by(id: session[:user_id])
    this_question = Question.find_by(id: params[:question_id])
    this_comment = Comment.create(body: params[:body], user_id: session[:user_id])
    this_question.comments << this_comment

    erb :"shared/_comments", layout: false, locals: {comment: this_comment}
  else
    @errors = "You are not logged in"
    redirect "/"
  end
end
post '/answers/:answer_id/comments' do
  if session[:user_id]
    this_user = User.find_by(id: session[:user_id])
    this_answer = Answer.find_by(id: params[:answer_id])
    this_comment = Comment.create(body: params[:body], user_id: session[:user_id])
    this_answer.comments << this_comment

    erb :"shared/_comments", layout: false, locals: {comment: this_comment}

  else
    @errors = "You are not logged in"
    redirect "/"
  end
end
