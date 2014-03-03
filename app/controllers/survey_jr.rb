get '/surveys/all' do

  erb :'/survey_jr/all_surveys_jr'
end

get '/survey/take/:survey_id' do

  if current_user
    @survey = Survey.find(params[:survey_id])
    @current_user = User.find(session[:id])
    erb :'/survey_jr/take_survey_jr'
  else
    erb :index
  end
end

get '/user/:user_id/surveys' do
  @current_user = User.find(session[:id])

  if request.xhr?

  else
    erb :'/survey_jr/my_surveys_jr'
  end
end

post '/survey/:survey_id/record' do

  total_response = Response.all.length
  @survey = Survey.find(params[:survey_id])
  @current_user = User.find(session[:id])

  @survey.questions.each do |question|
    Response.create({
      taker_id: session[:id],
      choice_id: params[(question.id).to_s]})
  end

  if request.xhr?
    erb :response_recorded, :layout => false
  else
    redirect "/profile/#{@current_user.id}"
  end
end
