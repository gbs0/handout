class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.string :title
      t.string :description
      t.string :content
      t.string :author
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
