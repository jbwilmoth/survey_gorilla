get '/survey/:survey_id/edit' do
  @survey = Survey.find(params[:survey_id])
  erb :edit_survey
end

post '/edit_survey' do
  @survey = Survey.find(params[:survey_id].to_i)
  @survey.update_attributes( name: params[:survey_name])
  @question = @survey.questions[0]
  @question.update_attributes(content: params[:question])
  @choices = @question.choices
  @choices.each_with_index do |choice, index|
    choice.update_attributes(content: params[("choice#{index}").to_sym])
  end

  redirect "/survey/edit/#{params[:survey_id]}"
end

get '/survey/:survey_id/results' do
  @total_responses = 0
  @survey = Survey.find(params[:survey_id].to_i)
  @survey.questions.each do |question|
    question.choices.each do |choice|
      @total_responses += choice.responses.count
    end
  end

  erb :view_results
end
