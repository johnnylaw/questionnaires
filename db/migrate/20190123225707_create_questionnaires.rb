class CreateQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaires do |t|
      t.string :title
      t.string :subtitle
      t.string :permalink
    end

    add_index :questionnaires, :permalink, unique: true
  end
end
