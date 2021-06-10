class AddMemberIdToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :member_id, :integer
  end
end
