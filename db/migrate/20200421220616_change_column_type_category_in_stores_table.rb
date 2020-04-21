class ChangeColumnTypeCategoryInStoresTable < ActiveRecord::Migration[6.0]
  def change
    change_column :stores, :category, :string
  end
end
