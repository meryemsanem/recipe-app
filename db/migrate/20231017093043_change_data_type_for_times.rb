class ChangeDataTypeForTimes < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :preparation_time, :decimal
    change_column :recipes, :cooking_time, :decimal
  end
end
