get '/comments/new' do
  #ajax call for comment form
end

post '/comments' do
  if session[:user_id]
    this_user = User.find_by(id: session[:user_id])
    this_comment = Comment.new(body: params[:body])
    this_user.comments << this_comment
    #use ajax to display this comment on the current item
    #no delegation required
  else
    @errors = "You are not logged in"
    redirect "/"
  end
end
