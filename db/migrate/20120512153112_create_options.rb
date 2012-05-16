class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id
      t.integer :order
      t.string :string

      t.timestamps
    end
  end
end
