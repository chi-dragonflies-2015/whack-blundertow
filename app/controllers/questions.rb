get '/questions/:question_id' do
  @question = Question.find_by(id: params[:question_id])
  erb :"questions/show"
end

post '/questions' do

  if session[:user_id]

  else
    @errors = "You are not logged in"
    redirect "/index"

  Question.create()
end
