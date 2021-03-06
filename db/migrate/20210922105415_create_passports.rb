class CreatePassports < ActiveRecord::Migration[6.1]
  def change
    create_table :passports do |t|
      t.string :title
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
