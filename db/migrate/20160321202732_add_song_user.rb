class AddSongUser < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.belongs_to :user
    end
  end
end
