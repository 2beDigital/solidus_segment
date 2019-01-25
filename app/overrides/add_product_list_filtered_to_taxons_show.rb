Deface::Override.new(
  virtual_path: 'spree/taxons/show',
  name: 'add_product_list_filtered_to_taxons_show',
  insert_before: ".taxon-title",
  partial: 'spree/shared/trackers/segment/product_list_filtered.js'
)

