Deface::Override.new(
  virtual_path: 'spree/shared/_minicart_content',
  name: 'add_cart_viewed_to_orders_edit',
  insert_bottom: "#form_dynamic_cart",
  partial: 'spree/shared/trackers/segment/cart_viewed.js'
)
