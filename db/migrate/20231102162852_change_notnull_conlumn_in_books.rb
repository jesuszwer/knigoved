class ChangeNotnullConlumnInBooks < ActiveRecord::Migration[7.1]
  def change
    change_column :books, :title, :string, :null => false
    change_column :books, :genre, :string, :null => false
    change_column :books, :author, :string, :null => false
  end
end
