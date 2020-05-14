class Topic < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :name
  end


  validates :name, presence: true
  has_many :articles, through: :article_topics

end
