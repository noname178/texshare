class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :image
      t.string :title
      t.string :lesson
      t.string :teacher
      t.string :under
      t.string :status
      t.integer :owner_id
      t.integer :receiver_id
      t.timestamps null: false
    end
  end
end
