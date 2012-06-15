class AddNoToRecommend < ActiveRecord::Migration
  def change
    add_column :recommends, :recommend_no, :integer
  end
end
