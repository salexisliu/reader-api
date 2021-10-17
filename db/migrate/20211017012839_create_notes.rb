class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.belongs_to :line, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
