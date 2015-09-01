class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :song

  validates :user_id, uniqueness: {scope: :song_id, message: "You may only upvote once."}
end
