class AddSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song_title
      t.string :artist
      t.string :album
    end
  end
end
