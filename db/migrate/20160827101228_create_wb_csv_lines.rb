class CreateWbCsvLines < ActiveRecord::Migration
  def change
    create_table :wb_csv_lines do |t|
      t.string :code
      t.string :ocode
      t.date :arrival
      t.date :departure
      t.date :received
      t.string :name
      t.string :phone
      t.string :email
      t.float :price
      t.integer :roomn
      t.string :status
      t.string :origin

      t.timestamps null: false
    end
  end
end
