$(document).ready(function() {
  $('#create-survey').on('submit', function(event) {
    event.preventDefault();
    surveyTitle = $('input[name=name]').val();
    console.log(surveyTitle);
    var data = $(this).serialize();
    $.post('/create_survey', data)
    $(this).hide();
    $('#survey-name').append("Title: " + surveyTitle + " ");

    $.get('/add_question', function(serverResponse){
      $('#append-question').append(serverResponse);

      $('#add-question').on('submit', function(event){
        event.preventDefault();
        var data = $(this).serialize();
        $.post('/add_question', data, function(serverUserId){
          userId = serverUserId['user_id']
          window.location.href = "/user/"+ userId +"/surveys";
        }, 'json');
      });
    });
  });
});
