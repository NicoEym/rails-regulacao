class Article < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :chapter, :section, :number, :details, :topics, :governance

    searchableAttributes ['topics', 'section', 'details', 'governance']
    customRanking ['asc(number)']
  end

  belongs_to :governance
  validates :number, presence: true
  validates :chapter, presence: false
  validates :section, presence: false
  validates :details, presence: true
  has_many :article_topics
  has_many :topics, through: :article_topics
end
