class QuestionOptionSet < ApplicationRecord
  belongs_to :question
  belongs_to :option_set
end
