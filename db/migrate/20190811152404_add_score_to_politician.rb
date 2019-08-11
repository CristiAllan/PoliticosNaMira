class AddScoreToPolitician < ActiveRecord::Migration[6.0]
  def change
    add_column :politicians, :score, :integer, default: 1000
  end
end
