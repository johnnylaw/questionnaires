class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.string :user_uuid
      t.references :question, foreign_key: true
      t.decimal :value
    end
  end
end
