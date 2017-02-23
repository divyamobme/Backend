class CreateUsersTable < ActiveRecord::Migration[5.0]
  def up
    create_table :registers do |t|
    t.string :name
    t.string :email
    t.string :password_digest
   end
  end
def down
drop_table :registers
end
end
