class ChangeDefaultQuote < ActiveRecord::Migration
  def change
    change_column :quotes, :up, :integer, default: 1
    change_column :quotes, :down, :integer, default: 1
  end
end
