class AddReviewCountsToProperty < ActiveRecord::Migration[7.2]
  def change
    add_column :properties, :reviews_count, :integer
  end
end
