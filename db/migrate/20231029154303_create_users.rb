class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.string :last_name
      t.integer :age
      t.boolean :its_admin

      t.timestamps
    end
  end
end
