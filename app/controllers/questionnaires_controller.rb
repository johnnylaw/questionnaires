class QuestionnairesController < ApplicationController
  def show
    @questionnaire = Questionnaire.find_by permalink: params[:id]
  end
end
