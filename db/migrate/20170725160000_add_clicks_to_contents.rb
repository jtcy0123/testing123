class AddClicksToContents < ActiveRecord::Migration[5.1]
  def change
    add_column :contents, :clicks, :integer, default: 0
  end
end
