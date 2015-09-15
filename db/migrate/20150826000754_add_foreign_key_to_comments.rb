class AddForeignKeyToComments < ActiveRecord::Migration
  def change
    add_column      :comments, :post_id, :int
    add_foreign_key :comments, :posts
  end
end
