class AddAllowedForToSpreeShippingMethods < ActiveRecord::Migration
  def change
    add_column :spree_shipping_methods, :allowed_for, :integer, default: 0
  end
end
