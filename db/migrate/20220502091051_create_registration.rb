class CreateRegistration < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :surname

      t.timestamps
    end
  end
end
