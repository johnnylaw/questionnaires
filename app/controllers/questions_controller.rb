class QuestionsController < ApplicationController
  def update
    questionnaire = Questionnaire.find_by permalink: params[:questionnaire_id]
    question = questionnaire.questions.find_by number: params[:id]
    response = Response.find_or_initialize_by user_uuid: user_uuid, question: question

    response.update value: params[:value]
  end
end
