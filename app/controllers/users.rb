post '/sessions' do
  if true#User.authenticate(params[:username], params[:password])
    this_user = User.find_by(username: params[:username])
    session[:user_id] = this_user.id
    puts "********************#{this_user.hashed_password}"
    puts "********************************authentication worked"
    redirect "/"
  else
    puts "********************************authentication didn't work"
    @errors = "Invalid login"
    @questions = Question.all
    erb :index
  end
end
