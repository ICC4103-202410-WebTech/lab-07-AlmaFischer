class AddDefaultToPublishedAtInPosts < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :published_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
