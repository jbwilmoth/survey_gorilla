## Sign in
get '/login' do
  erb :"user/login"
end

post '/login' do
  @user = User.find_by email: params[:email]

  if @user && @user.authenticate(params[:password])
    session[:id] = @user.id
    redirect "/profile/#{@user.id}"
  else
    @errors = {:Invalid=>["Incorrect Login"]}
    erb :"user/login"
  end
end

## Log out
get '/logout' do
  session[:id] = nil
  redirect '/'
end
