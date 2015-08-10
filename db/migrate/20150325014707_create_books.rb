class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.datetime :publish_date
      t.string :author
      t.integer :number_page
      t.string :category
      t.string :picture

      t.timestamps null: false
    end
  end
end
