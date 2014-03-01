get '/create_survey' do
  erb :create_survey
end

post '/create_survey' do
  session[:id] = 1
  survey = Survey.create!(creator_id: session[:id],
                          name: params[:name])
end

get '/add_question' do
  erb :add_question
end

post '/add_question' do
  session[:id] = 1
  content_type :json
  survey = Survey.last
  survey.questions.create!(content: params[:question_context])
  {user_id: session[:id]}.to_json
end
