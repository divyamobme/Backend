class CreateMoviesTable < ActiveRecord::Migration[5.0]
  def up
    create_table :movies do |t|
    t.string  :moviename
    t.string  :language
    t.integer :rating
    t.string  :description
    t.string  :image
    t.string  :director
    t.string  :producer
    t.string  :maincast
    end
  end
  def down
   drop_table :movies
  end
end
