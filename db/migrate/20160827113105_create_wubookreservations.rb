class CreateWubookreservations < ActiveRecord::Migration
  def change
    create_table :wubookreservations do |t|

      t.timestamps null: false
    end
  end
end
