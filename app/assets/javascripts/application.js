// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require_tree .

$(function() {
  $('input[type=radio]').change(function() {
    var input = $(this);
    var question = input.parents('.question-container');
    var questionsContainer = question.parents('.questions-container');
    console.log(questionsContainer)
    var questionnaire = question.parents('.questionnaire-container');

    var value = input.val();
    var questionId = question.data('question-id');
    var questionnaireId = questionnaire.data('questionnaire-id');

    $.ajax({
      url: '/questionnaires/' + questionnaireId + '/questions/' + questionId,
      method: 'PATCH',
      data: 'value=' + value
    });

    var offset = -(questionId + 1) * questionsContainer[0].offsetWidth;
    questionsContainer.animate({ left: offset + 'px' })
  })

  $('button[data-offset]').click(function() {
    var responsesContainer = $(this).parents('.questions-container');
    var offset = -($(this).data('offset') + 1) * responsesContainer[0].offsetWidth;
    responsesContainer.animate({ left: offset + 'px' })
  })
})
