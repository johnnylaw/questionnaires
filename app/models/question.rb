class Question < ApplicationRecord
  belongs_to :questionnaire
  belongs_to :option_set

  has_many :responses
end
