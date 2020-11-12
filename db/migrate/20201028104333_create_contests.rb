class CreateContests < ActiveRecord::Migration[6.0]
  def change
    create_table :contests do |t|
      t.string :title
      t.text :text
      t.string :status

      t.timestamps
    end
  end
end
