class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :summary
      t.string :author
      t.string :finished
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
