class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :quest
      t.string :answer
      t.string :key
      t.integer :score
      t.references :contest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
