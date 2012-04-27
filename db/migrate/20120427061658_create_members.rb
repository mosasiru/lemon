class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :username
      t.string :password
      t.integer :sex
      t.integer :age

      t.timestamps
    end
  end
end
