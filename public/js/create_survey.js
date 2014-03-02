$(document).ready(function() {
  // Hides the link
  $('.finish-survey').toggle();

  // Action to be taken when the create-survey submit button is clicked
  $('#create-survey').on('submit', function(event) {
    event.preventDefault();
    surveyTitle = $('input[name=name]').val();
    console.log(surveyTitle);
    var data = $(this).serialize();

    // Posts the survey title to the server
    $.post('/create_survey', data)
    $(this).hide();
    $('#survey-name').append("Title: " + surveyTitle + " ");

    // Gets the add-question form
    $.get('/add_question', function(serverResponse){
      $('#append-question').append(serverResponse);

      // Action to be taken when the add-question submit button is clicked
      $('#add-question').on('submit', function(event){
        event.preventDefault();
        var data = $(this).serialize();

        // Posts the question data to the server
        $.post('/add_question', data, function(serverUserId){
          userId = serverUserId['user_id'];
        }, 'json');

        var questionContext = $(this.question_context).val();
        $(this).hide();
        $('#question-context').append('Question: ' + questionContext);

        // Gets the add-choice form
        $.get('/add_choice', function(serverResponse) {
          $('#append-choice').append(serverResponse);
          $('.finish-survey').toggle();

          // Action to be taken when the add-choice submit button is clicked
          $('#add-choice').on('submit', function(event) {
            event.preventDefault();
            var choiceContext = $(this.choice_context).val();
            var data = $(this).serialize();

            // Posts the choice data to the server
            $.post('/add_choice', data, function() {
              // window.location.href = "/user/"+ userId +"/surveys";

            });
          });
        });
      });
    });
  });
});
