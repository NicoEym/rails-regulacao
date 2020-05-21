class Article < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attributes :chapter, :section, :number, :details

    searchableAttributes ['chapter', 'section', 'details', ]
    customRanking ['asc(number)']
  end

  belongs_to :governance
  validates :number, presence: true
  validates :chapter, presence: true
  validates :section, presence: true
  validates :details, presence: true
  has_many :article_topics
  has_many :topics, through: :article_topics
end
