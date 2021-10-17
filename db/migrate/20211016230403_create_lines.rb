class CreateLines < ActiveRecord::Migration[6.1]
  def change
    create_table :lines do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.text :content
      t.boolean :highlighted
     

      t.timestamps
    end
  end
end
