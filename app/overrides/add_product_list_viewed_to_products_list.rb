Deface::Override.new(
  virtual_path: 'spree/shared/_products',
  name: 'add_product_list_viewed_to_products_list',
  insert_before: "[data-hook='products_search_results_heading']",
  partial: 'spree/shared/trackers/segment/product_list_viewed.js'
)

Deface::Override.new(
    virtual_path: '/spree/taxons/show',
    name: 'add_product_list_viewed_to_products_list',
    insert_after: "[data-hook='taxon_products']",
    partial: 'spree/shared/trackers/segment/product_list_viewed.js'

)

