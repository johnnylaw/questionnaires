class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :questionnaire, foreign_key: true
      t.integer :number
      t.references :option_set, foreign_key: true
      t.string :body
    end
  end
end
