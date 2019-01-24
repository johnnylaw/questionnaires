class ResponseAverage < Struct.new(:question, :average, :number)
  def to_partial_path
    'responses/average'
  end
end

class ResponsesController < ApplicationController
  def index
    @questionnaire = Questionnaire.find_by permalink: params[:questionnaire_id]
    questions = @questionnaire.questions
    @averages = questions.map do |question|
      average = (Response.where(question: question).average(:value) * 10).floor / 10.0
      ResponseAverage.new question.body, average, question.number
    end
  end
end
