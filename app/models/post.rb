class Post < ApplicationRecord
  module Filters
    BOOK = :book
    ARTICLE = :article
    PODCAST = :podcast

    def self.all
      [BOOK, ARTICLE, PODCAST]
    end
  end

  belongs_to :friend
  validates :title, presence: true
  validates :kind, presence: true
  scope :articles, -> { where(kind: Filters::ARTICLE) }
  scope :books, -> { where(kind: Filters::BOOK) }
  scope :podcasts, -> { where(kind: Filters::PODCAST) }
end
