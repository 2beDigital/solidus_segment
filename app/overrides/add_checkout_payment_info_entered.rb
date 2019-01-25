Deface::Override.new(
    virtual_path: 'spree/checkout/_payment',
    name: 'add_payment_info_entered',
    insert_bottom: "[data-hook='checkout_payment_step']",
    partial: 'spree/shared/trackers/segment/payment_info_entered.js'
)

