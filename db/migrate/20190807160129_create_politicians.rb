class CreatePoliticians < ActiveRecord::Migration[6.0]
  def change
    create_table :politicians do |t|
      t.string :name
      t.string :political_party
      t.integer :age
      t.string :type
      t.string :state
      t.string :image_url

      t.timestamps
    end
  end
end
