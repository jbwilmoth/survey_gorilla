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
  @current_user = User.find(1)

  erb :'/survey_jr/my_surveys_jr'
end
