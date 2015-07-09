module AllowShippingMethodsOverrides
  def shipping_methods(package, display_filter)
    super.select do |ship_method|
      begin
        ship_method.allowed_to_display(order.user_id?)
      rescue Exception => exception
        log_calculator_exception(ship_method, exception)
      end
    end
  end
end

Spree::Stock::Estimator.class_eval do
  prepend AllowShippingMethodsOverrides
end
