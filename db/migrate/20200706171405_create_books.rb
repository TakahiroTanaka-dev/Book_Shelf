class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :author, null: false
      t.string :text, null: false
      t.text :image, null: false
      t.timestamps
    end
  end
end
