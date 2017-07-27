class CreateLike < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user
      t.references :story
      t.timestamps
    end
  end
end
