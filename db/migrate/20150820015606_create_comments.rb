class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :made_by
      t.text :body

      t.timestamps null: false
    end
  end
end
