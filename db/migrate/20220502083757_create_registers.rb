class CreateRegisters < ActiveRecord::Migration[7.0]
  def change
    create_table :registers do |t|
      t.string :name
      t.string :surname
      t.integer :number
      
      t.timestamps
    end
  end
end
