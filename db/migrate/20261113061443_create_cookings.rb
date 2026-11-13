class CreateCookings < ActiveRecord::Migration[8.1]
  def change
    create_table :cookings do |t|
      t.string :title
      t.text :content
      t.integer :genre_id

      t.timestamps
    end
  end
end
