Spree::ShippingMethod.class_eval do

  ALLOWED_FOR = [:both, :guest, :user]

  enum allowed_for: ALLOWED_FOR

  def allowed_to_display(logged_user)
    both? || (logged_user ? user? : guest?)
  end
end
