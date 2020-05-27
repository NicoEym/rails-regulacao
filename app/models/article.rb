class Article < ApplicationRecord

  include AlgoliaSearch

  algoliasearch do
    attributes :chapter, :section, :number, :details, :governance
    add_attribute :topics
    searchableAttributes ['topics', 'details', 'section', 'governance']
    customRanking ['asc(number)']
    attributeForDistinct "governance"
  end

  belongs_to :governance
  validates :number, presence: true
  validates :chapter, presence: false
  validates :section, presence: false
  validates :details, presence: true
  has_many :article_topics
  has_many :topics, through: :article_topics
end
