class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :user
      t.references :content

      t.timestamps
    end
  end
end
