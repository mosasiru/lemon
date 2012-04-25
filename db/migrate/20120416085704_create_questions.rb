class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.integer :member_id
      t.integer :category_id

      t.timestamps
    end
  end
end
