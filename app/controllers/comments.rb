get '/comments/new' do
  #ajax call for comment form
end

post '/comments' do
  this_comment = Comment.new(body: params[:body], user_id: session[:user_id])
end
