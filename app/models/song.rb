class Song < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  validates :song_title, presence: true
  validates :artist, presence: true
  validates :album, presence: true
end
