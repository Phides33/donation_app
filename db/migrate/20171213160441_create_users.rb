class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :po_code
      t.string :mob_number
      t.string :first_name
      t.string :last_name
      t.integer :amount_bracket
      t.integer :year
      t.integer :cause
      t.string :why_not_more
      t.integer :own_emotion
      t.integer :other_emotion
      t.integer :preferred_mean
      t.string :money_wish
      t.integer :gender
      t.integer :age_bracket
      t.integer :main_mobility_mode
      t.boolean :motor_vehicle_owner
    end
  end
end
