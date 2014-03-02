get '/create_survey' do
  erb :create_survey
end

post '/create_survey' do
  survey = Survey.create!(creator_id: session[:id],
                          name: params[:name])
end

get '/add_question' do
  erb :add_question, :layout => false
end

post '/add_question' do
  puts '=============== ADD QUESTION ===================='
  p params
  content_type :json
  survey = Survey.last
  survey.questions.create!(content: params[:question_context])
  # {user_id: session[:id]}.to_json
end

get '/add_choice' do
  erb :add_choices, :layout => false
end

post '/add_choice' do
  puts '======================== ADD CHOICE ========================='
  p params
  question = Question.last
  question.choices.create!(content: params[:choice_context])
end
