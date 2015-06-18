get '/questions/new' do
    erb :"ask_question"
end


get '/questions/:question_id' do
  @question = Question.find_by(id: params[:question_id])
  if @question.best_answer_id != nil
    @mode = "has a best"
  else
    if session[:user_id] == @question.user_id
      @mode = "pick a best"
    else
      @mode = "no best"
    end
  end
  @q_comments = @question.comments
  @answers = @question.answers
  erb :"question"
end

post '/questions' do
  if session[:user_id]
    this_user = User.find_by(id: session[:user_id])
    this_question = Question.new(title: params[:title], body: params[:body], user_id: session[:user_id])
    if this_question.save
      redirect "/"
    else
      @errors = 'please ask a valid question'
      erb :"ask_question"
    end

    #return a partial for adding a question to the top of the list
    #use delegation to make these links work even before they get refreshed
  else
    @errors = "You are not logged in"
    erb :index
  end

end
