class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.datetime  :age
      t.boolean   :sex
      t.string :nrc_no, null: false
      t.string :email
      t.string :phone
      t.string :external_id
      t.string :township
      t.string :address
      
      t.timestamps
    end
  end
end
