class AddFieldsToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :author, :string
    add_column :quotes, :ranking, :integer
  end
end
