class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.string :username
      t.integer :sex
      t.date :birthday

      t.timestamps
    end
  end
end
