class UsertableMakeEmailNamePasswordAgeRequired < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :email, :string, :null => false
    change_column :users, :name, :string, :null => false
    change_column :users, :password, :string, :null => false
    change_column :users, :age, :integer, :null => false
  end
end
