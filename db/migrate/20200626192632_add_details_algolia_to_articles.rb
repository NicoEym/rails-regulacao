class AddDetailsAlgoliaToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :details_algolia, :string
  end
end
