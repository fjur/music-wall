class AddVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :value
      t.belongs_to :user, index: true
      t.belongs_to :song, index: true
    end
  end
end
