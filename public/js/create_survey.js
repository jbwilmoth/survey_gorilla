$(document).ready(function() {
  // Hides the links
  $('.finish-survey').hide();
  $('.add-question').toggle();
  $('.choice-feature').toggle();

  // Action to be taken when the create-survey submit button is clicked
  $('#create-survey').on('submit', function(event) {
    event.preventDefault();
    surveyTitle = $('input[name=name]').val();
    console.log(surveyTitle);
    var data = $(this).serialize();

    // Posts the survey title to the server
    $.post('/create_survey', data);
    // $('.add-question').toggle();
    $(this).hide();
    $('#survey-name').append("Title: " + surveyTitle + " ");

    // $('.add-question').on('click', function(event) {
    //   event.preventDefault();

      // Gets the add-question form
      $.get('/add_question', function(serverResponse){
        $('#append-question').append(serverResponse);

        // Action to be taken when the add-question submit button is clicked
        $('#add-question').on('submit', function(event){
          event.preventDefault();
          var data = $(this).serialize();

          // Posts the question data to the server
          $.post('/add_question', data, function(serverUserId){
            // userId = serverUserId['user_id'];
          }, 'json');

          var questionContext = $(this.question_context).val();
          $(this).hide();
          $('#question-context').append('Question: ' + questionContext);

          // Gets the add-choice form
          $.get('/add_choice', function(serverResponse) {
            $('#append-choice').append(serverResponse);
            // $('.add-question').toggle();


            // Action to be taken when the add-choice submit button is clicked
            $('#add-choice').on('submit', function(event) {
              event.preventDefault();
              var choiceContext = $(this.choice_context).val();
              var data = $(this).serialize();

              // Posts the choice data to the server
              $.post('/add_choice', data, function() {
                $('.choice-feature').show();
                $('#choice-context').append(choiceContext + '</br>');
                $('#choice-input').val('');
                $('.finish-survey').show();    // window.location.href = "/user/"+ userId +"/surveys";
              });
            });
          });
        });
      });
    // });

  });
});
