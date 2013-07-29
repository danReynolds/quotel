class AddUpToRank < ActiveRecord::Migration
  def change
    remove_column :quotes, :ranking
    add_column :quotes, :up, :integer
    add_column :quotes, :down, :integer
  end
end
