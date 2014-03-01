get '/surveys/all' do

  erb :'/survey_jr/all_surveys_jr'
end

get '/survey/take/:survey_id' do

  @survey = Survey.find(1)
  @current_user = User.find(1)

  erb :'/survey_jr/take_survey_jr'
end

get '/user/:user_id' do

  # @user = User.find(params[:user_id])
  @current_user = User.find(1)


  erb :'/survey_jr/index'
end

get '/user/:user_id/surveys' do

  # @user = User.find(params[:user_id])
  @current_user = User.find(session[:id])

  erb :'/survey_jr/my_surveys_jr'
end

post '/survey/:survey_id/record' do
  total_response = Response.all.length
  @survey = Survey.find(params[:survey_id])
  @current_user = User.find(session[:id])

  @survey.questions.each do |question|
      Response.create({
        taker_id: session[:id],
        choice_id: params[question.id]})
  end

    redirect "/user/#{@current_user.id}"

end
