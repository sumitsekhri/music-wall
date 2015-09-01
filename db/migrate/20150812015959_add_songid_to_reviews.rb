class AddSongidToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :song_id, :integer
  end
end
