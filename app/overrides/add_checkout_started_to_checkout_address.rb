Deface::Override.new(
    virtual_path: 'spree/checkout/_address',
    name: 'add_checkout_started',
    insert_before: "[data-hook='billing_fieldset_wrapper']",
    partial: 'spree/shared/trackers/segment/checkout_started.js'
)

