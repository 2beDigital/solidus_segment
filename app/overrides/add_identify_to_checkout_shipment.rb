Deface::Override.new(
    virtual_path: 'spree/checkout/_delivery',
    name: 'add_identify_to_checkout_shipment',
    insert_bottom: "[data-hook='shipping_method_inner']",
    text: "<% if !Rails.env.staging? %>
            <%  Track::User.new(spree_current_user,request).identify_user%>
           <% end %>"
)

