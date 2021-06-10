class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.text :company
      t.string :name
      t.string :address
      t.string :tel
      t.string :email
      t.string :last_visit_date
      t.text :memo

      t.timestamps
    end
  end
end
