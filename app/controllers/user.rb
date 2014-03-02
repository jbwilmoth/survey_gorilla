## Sign up // create a new user
get '/register' do
  erb :'user/register'
end

post '/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/profile/#{@user.id}"
  else
    @errors = @user.errors.messages
    erb :'user/register'
  end
end

## Edit user information
get '/profile/:profile_id/edit' do
  if current_user.id.to_i == params[:profile_id].to_i
    erb :'user/edit_profile'
  else
    redirect '/' #change to 404 error, add 404 get to session
  end
end

post '/profile/:profile_id/edit' do
  current_user.update_attributes(params[:user])

  if current_user.save
    redirect "/profile/#{current_user.id}"
  else
    @errors = current_user.errors.messages
    erb :'/user/edit_profile'
  end
end

## Delete your account
get '/profile/:profile_id/delete' do

  if current_user.id.to_i == params[:profile_id].to_i
    if request.xhr?
      erb :'user/confirm_delete', :layout => false
    else
      redirect "/user/edit_profile" #change to 404 error, add 404 get to session
    end
  else
    redirect '/'
  end
end

post '/profile/:profile_id/delete' do
  current_user.destroy
  session[:id] = nil
  redirect '/'
end

## User Dashboard page
get '/profile/:profile_id' do
  if current_user.id.to_i == params[:profile_id].to_i
    @surveys = Survey.where(creator_id: current_user.id).order("created_at DESC")
    erb :'user/dashboard'
  else
    redirect '/' #change to 404 error, add 404 get to session
  end
end



