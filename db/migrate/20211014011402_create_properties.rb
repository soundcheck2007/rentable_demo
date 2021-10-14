class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :email
      t.string :rentableId
      t.string :city
      t.integer :numberOfBedrooms

      t.timestamps
    end
  end
end
