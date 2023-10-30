class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.integer :genre_id
      t.integer :author_id

      t.timestamps
    end
  end
end
