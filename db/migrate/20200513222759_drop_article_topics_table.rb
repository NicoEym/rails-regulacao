class DropArticleTopicsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :article_topics
  end
end
