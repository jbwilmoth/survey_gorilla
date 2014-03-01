## Sign in
get '/login' do
  erb :"user/login"
end

post '/login' do
  @user = User.find_by email: params[:email]
  @user.authenticate(params[:password]) 
  if @user
    session[:id] = @user.id
    redirect "/profile/#{@user.id}"
  else
    @errors = ["Username and password do not exist."]
    erb :"user/login"
  end
end

## Log out
get '/logout' do
  session[:id] = nil 
  redirect '/'
end 
