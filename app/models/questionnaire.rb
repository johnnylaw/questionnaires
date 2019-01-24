class Questionnaire < ApplicationRecord
  has_many :questions, -> { order(:number).includes(option_set: :options) }
end
