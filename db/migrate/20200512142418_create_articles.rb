class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :number
      t.string :chapter
      t.string :section
      t.text :details
      t.references :governance, foreign_key: true

      t.timestamps
    end
  end
end
