module Spree
  OrdersController.class_eval do
    before_action :segment_product_added, only: [:populate], if: -> { params[:variant_id] }

    private

    def segment_product_added
      variant  = Spree::Variant.find(params[:variant_id])
      quantity = params[:quantity].to_i
      # 2,147,483,647 is crazy. See issue #2695.
      if quantity.between?(1, 2_147_483_647)
          Track::Product.new(variant.product,
                             user: spree_current_user,
                             product_url: product_url(variant.product),
                             order_number: current_order(create_order_if_necessary: true).number,
                             quantity: quantity,
                             currency: current_currency).product_added
      end
    end

  end
end
