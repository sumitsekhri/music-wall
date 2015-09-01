class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :song

  validates :song_id, presence: true
  validates :user_id, presence: true, uniqueness: {scope: :song_id, message: "You may only review once."}
end
