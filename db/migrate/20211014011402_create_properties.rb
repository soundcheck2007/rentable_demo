class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :rentableId, unique: true
      t.string :name
      t.string :email
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
