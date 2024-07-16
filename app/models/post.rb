class Post < ApplicationRecord
  belongs_to :friend
  validates :title, presence: true
  validates :kind, presence: true
  scope :articles, -> { where(kind: Filters::ARTICLE) }
end

module Filters
  BOOK = :book
  ARTICLE = :article
  PODCAST = :podcast

  def self.all
    [BOOK, ARTICLE, PODCAST]
  end
end
