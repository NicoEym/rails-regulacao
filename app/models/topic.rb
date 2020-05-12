class Topic < ApplicationRecord
  validates :name, presence: true
  has_many :articles, through: :article_topics
end
