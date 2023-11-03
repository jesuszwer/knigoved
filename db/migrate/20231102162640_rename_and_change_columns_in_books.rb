class RenameAndChangeColumnsInBooks < ActiveRecord::Migration[7.1]
  def change
    rename_column :books, :author_id, :author
    rename_column :books, :genre_id, :genre
    change_column :books, :author, :string
    change_column :books, :genre, :string
  end
end
