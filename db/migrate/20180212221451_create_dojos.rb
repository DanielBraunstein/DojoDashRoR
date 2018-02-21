class CreateDojos < ActiveRecord::Migration
  def change
    create_table :dojos do |t|
      t.string :name
      t.string :street
      t.string :state
      t.string :city

      t.timestamps null: false
    end
  end
end
