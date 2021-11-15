class AddPostStatusToBlogs < ActiveRecord::Migration[6.1]
  enum status: {draft: 0, published: 1}
  def change
    add_column :blogs, :status, :integer, default: 0
  end
end
