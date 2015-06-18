get '/comments/new' do
  #ajax call for comment form
end

post '/questions/:question_id/comments' do
  if session[:user_id]
    this_user = User.find_by(id: session[:user_id])
    this_question = Question.find_by(id: params[:question_id])
    this_comment = Comment.create(body: params[:body], user_id: session[:user_id])
    this_question.comments << this_comment
    redirect "/questions/#{params[:question_id]}"
    #use ajax to display this comment on the current item
    #no delegation required
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
    puts "#{this_answer.comments.inspect}--------------------------"
    question = this_answer.question
    redirect "/questions/#{question.id}"
    #use ajax to display this comment on the current item
    #no delegation required
  else
    @errors = "You are not logged in"
    redirect "/"
  end
end
