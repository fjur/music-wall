class AddReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :user, index: true
      t.belongs_to :song, index: true
      t.string :title
      t.string :content
      t.integer :rating
    end
  end
end
