class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :subject
      t.string :description
      t.string :link
      t.string :photos
      t.references :mood
      t.string :category

      t.timestamps
    end
  end
end
