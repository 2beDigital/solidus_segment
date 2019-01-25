# app/services/track/order.rb
class Track::Order
  def initialize(order, request = {})
    @order = order
    @request = request
  end
  
  def completed
    Analytics.track(
        user_id: @order.user_id || @order.email,
        event: 'Order Completed',
        properties: {
          checkout_id: @order.number,
          order_id: @order.id,
          total: @order.total,
          revenue: @order.total - @order.shipment_total - @order.additional_tax_total,
          shipping:@order.shipment_total,
          tax: @order.additional_tax_total,
          discount: @order.promo_total,
          coupon: @order.coupon_code,
          currency: @order.currency,
          products: order_line_items
        }
    )
  end

  def order_line_items
    line_items = []
    @order.line_items.each do |line_item|
      line_items << {
          id: line_item.product.id, #line_item.variant.id
          sku: line_item.variant.sku,
          name: line_item.product.name,
          price: line_item.price,
          quantity: line_item.quantity
      }
    end
    line_items
  end

end
