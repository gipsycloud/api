class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :display_name
      t.string :email_address
      t.string :phone_number
      t.string :points
      t.string :coupons
      t.string :stores
      
      t.timestamps
    end
  end
end
