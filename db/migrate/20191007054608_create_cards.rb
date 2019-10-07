class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :card_no
      t.string :registration_date
      t.string :status
      
      t.timestamps
    end
  end
end
