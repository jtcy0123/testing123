class AddCount < ActiveRecord::Migration[5.1]
  def change
  	add_column :contents, :count, :integer
  end
end
