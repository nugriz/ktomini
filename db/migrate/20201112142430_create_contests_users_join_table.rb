class CreateContestsUsersJoinTable < ActiveRecord::Migration[6.0]
    def change
        create_table :contests_users, id: false do |t|
          t.bigint :contest_id
          t.bigint :user_id
        end
     
        add_index :contests_users, :contest_id
        add_index :contests_users, :user_id
    end
end