get '/questions/new' do
    erb :"ask_question"
  end

get '/questions/:question_id' do
  @question = Question.find_by(id: params[:question_id])
  @q_comments = @question.comments
  @answers = @question.answers
  erb :"question"
end

post '/questions' do
  if session[:user_id]
    this_user = User.find_by(id: session[:user_id])
    this_question = Question.new(title: params[:title], body: params[:body], user_id: session[:user_id])
    #return a partial for adding a question to the top of the list
    #use delegation to make these links work even before they get refreshed
  else
    @errors = "You are not logged in"
    redirect "/"
  end

end
