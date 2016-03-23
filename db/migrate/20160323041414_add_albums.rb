class AddAlbums < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.string :album
    end
  end
end
