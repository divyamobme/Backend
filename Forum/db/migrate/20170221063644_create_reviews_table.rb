class CreateReviewsTable < ActiveRecord::Migration[5.0]
  def up
    create_table :reviews do |t|
    t.string :moviename
    t.string :username
    t.string :comments
    t.float :rating
   end
  end
  def down
    drop_table :reviews
  end
end
