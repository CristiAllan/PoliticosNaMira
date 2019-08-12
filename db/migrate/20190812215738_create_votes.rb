class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :politicians, null: false, foreign_key: true
      t.decimal :rating

      t.timestamps
    end
  end
end
