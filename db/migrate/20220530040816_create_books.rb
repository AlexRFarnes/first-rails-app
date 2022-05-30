class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :description
      t.string :author
      t.integer :pages
      t.integer :year

      t.timestamps
    end
  end
end
