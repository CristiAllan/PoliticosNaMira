class ChangePoliticianType < ActiveRecord::Migration[6.0]
  def change
    rename_column :politicians, :type, :kind
  end
end
