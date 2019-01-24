class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.references :option_set, foreign_key: true
      t.decimal :numerical
      t.string :name
    end
  end
end
