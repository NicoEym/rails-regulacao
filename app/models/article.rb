class Article < ApplicationRecord
  belongs_to :governance
  validates :number, presence: true
  validates :chapter, presence: true
  validates :section, presence: true
  validates :details, presence: true
  has_many :topics, through: :article_topics
end
