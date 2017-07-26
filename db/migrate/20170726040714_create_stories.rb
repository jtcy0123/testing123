class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :contents
      t.references :user
      t.references :mood

      t.timestamps
    end
  end
end
