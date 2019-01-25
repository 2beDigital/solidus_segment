Deface::Override.new(
  virtual_path: 'spree/shared/_minicart_content',
  name: 'add_product_removed_to_orders_edit',
  insert_bottom: "#form_dynamic_cart",
  partial: 'spree/shared/trackers/segment/product_removed.js'
)
