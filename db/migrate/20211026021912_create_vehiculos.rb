class CreateVehiculos < ActiveRecord::Migration[6.1]
  def change
    create_table :vehiculos do |t|
      t.string :titulo
      t.text :descripcion

      t.timestamps
    end
  end
end
