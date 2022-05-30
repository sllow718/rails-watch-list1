class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true, absence: false
  validates :overview, presence: true
end
