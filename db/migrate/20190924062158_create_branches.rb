class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :branch_name
      t.string :address
      t.string :phone
      t.string :township
      t.string :status
      t.string :capability
      t.string :category

      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.timestamps
    end
  end
end
