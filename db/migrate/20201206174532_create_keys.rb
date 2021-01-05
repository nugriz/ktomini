class CreateKeys < ActiveRecord::Migration[6.0]
  def change
    create_table :keys do |t|
      t.string :key
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
