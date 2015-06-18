post '/sessions' do
  if User.authenticate(params[:username], params[:password])
    this_user = User.find_by(username: params[:username])
    session[:user_id] = this_user.id
    redirect "/"
  else
    @errors = "Invalid login"
    @questions = Question.all
    erb :index
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect "/"
end

post '/users' do
  this_user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if this_user.save
    session[:user_id] = this_user.id
  else
    @questions = Question.all
  end
  erb :index
end
