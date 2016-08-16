class AddPostsStuff < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :post_body

      t.timestamp
    end
  end
end
