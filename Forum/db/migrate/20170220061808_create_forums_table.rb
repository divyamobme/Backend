class CreateForumsTable < ActiveRecord::Migration[5.0]
  def up
    create_table :forums do |t|
    t.string   :username
    t.string   :language
    t.string   :comments
    t.datetime :created_at
    end
  end
  def down
   drop_table :forums
  end
end
