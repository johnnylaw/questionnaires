class ResponsePresenter
  def initialize(question)
    @question = question
  end

  def average
    @average ||= begin
      normalized = (@question.responses.average(:value) - 1)
      (normalized * 10).floor / 10.0
    end
  end

  def number
    @question.number
  end

  def question
    @question.body
  end

  def option_set
    @question.option_set
  end

  def by_option
    option_set.options.map do |option|
      [option.numerical, @question.responses.where(value: option.numerical).count]
    end.to_h
  end

  def to_partial_path
    'responses/response'
  end
end

class ResponsesController < ApplicationController
  def index
    @questionnaire = Questionnaire.find_by permalink: params[:questionnaire_id]
    questions = @questionnaire.questions
    @responses = questions.map do |question|
      ResponsePresenter.new question
    end
  end
end
