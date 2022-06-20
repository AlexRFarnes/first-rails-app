class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.text :password
      t.text :token

      t.timestamps
    end
  end
end
