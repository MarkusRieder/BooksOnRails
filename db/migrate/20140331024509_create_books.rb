class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.string :genre
      t.string :shelf
      t.text :summary
      t.references :user

      t.timestamps
    end
    add_index :books, :user_id
  end
end
