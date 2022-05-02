class AddDescriptionToRegisters < ActiveRecord::Migration[7.0]
  def change
    add_column :registers, :name, :string
    add_column :registers, :surname, :string
    add_column :registers, :number, :integer
  end
end
