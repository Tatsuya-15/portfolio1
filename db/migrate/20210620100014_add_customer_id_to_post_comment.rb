class AddCustomerIdToPostComment < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :customer_id, :integer
  end
end
