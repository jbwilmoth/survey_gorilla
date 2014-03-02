get '/survey/:survey_id/edit' do
  @survey = Survey.find(params[:survey_id])
  if request.xhr?
    erb :edit_survey, :layout => false
  else
    redirect ('/')
  end
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

  if request.xhr?
    p "test"
  else
    redirect "/user/#{current_user.id}/surveys"
  end
end

get '/survey/:survey_id/results' do
  @total_responses = 0
  @survey = Survey.find(params[:survey_id].to_i)
  @survey.questions.each do |question|
    question.choices.each do |choice|
      @total_responses += choice.responses.count
    end
  end

  if request.xhr?
    erb :view_results, :layout => false
  else
    erb :view_results
  end
end

get '/survey/:survey_id/delete' do

  @survey = Survey.find(params[:survey_id])

  if request.xhr?
    @survey.destroy
  else
    erb :'/user/dashboard'
  end
end
