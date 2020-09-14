class AddFeedToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :img, :string
  end
end
