class CreateRecommends < ActiveRecord::Migration
  def change
    create_table :recommends do |t|
      t.integer :member_id
      t.integer :question_id

      t.timestamps
    end
  end
end
