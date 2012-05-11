class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :question_id
      t.integer :member_id
      t.integer :ans
      t.string :comment

#      t.timestamps
    end
    add_index :answers, [:question_id, :member_id], :unique => true
  end
end
