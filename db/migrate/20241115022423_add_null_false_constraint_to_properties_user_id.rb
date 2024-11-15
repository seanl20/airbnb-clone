class AddNullFalseConstraintToPropertiesUserId < ActiveRecord::Migration[7.2]
  def change
    change_column :properties, :user_id, :bigint, null: false
  end
end
