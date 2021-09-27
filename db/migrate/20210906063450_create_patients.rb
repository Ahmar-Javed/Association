class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|z
      t.string :name
      t.timestamps
    end
  end
end
