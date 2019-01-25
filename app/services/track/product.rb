# app/services/track/product.rb
class Track::Product
  def initialize(product, options = {})
    @product = product
    @user_id = options[:user] ? options[:user].id : 'anonymous_user'
    @order_number = options[:order_number]
    @product_url = options[:product_url]
    @quantity = options[:quantity]
    @currency = options[:currency]
  end

  def product_clicked
    Analytics.track(user_id: @user_id, event: 'Product Clicked', properties: product_properties)
  end

  def product_added
    Analytics.track(user_id: @user_id, event: 'Product Added', properties: product_properties)
  end

  private

  def product_properties
    product_props =  {
        product_id: @product.id,
        sku: @product.sku,
        category: @product.taxons.first.try(:name),
        name: @product.name,
        brand: Spree::Store.default.name,
        price: @product.price.to_f,
        currency: @currency,
        url: @product_url,
        image_url: @product.images.first.attachment.url
    }.tap do |hash|
      hash[:cart_id] = @order_number if @order_number.present?
      hash[:quantity] = @quantity if @quantity.present?
    end
    product_props
  end

end
