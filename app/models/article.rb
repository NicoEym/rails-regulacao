class Article < ApplicationRecord

  include AlgoliaSearch

  algoliasearch do
    attributes :chapter, :section, :number, :details_algolia, :governance, :topic_string
    searchableAttributes ['topic_string', 'details_algolia', 'section', 'governance']
    attributeForDistinct "governance"
  end

  belongs_to :governance
  validates :number, presence: true
  validates :chapter, presence: false
  validates :section, presence: false
  validates :details, presence: true
  has_many :article_topics
  has_many :topics, through: :article_topics

  def self.related(topic)
    self.where(topic: topic)
  end
end
