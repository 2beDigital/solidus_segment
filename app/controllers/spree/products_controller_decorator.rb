Spree::ProductsController.class_eval do

  before_action :segment_product_clicked, only: [:show], if: -> { @product }

  private

    def segment_product_clicked
      # Héctor Nota 25/07/2018 js version https://community.segment.com/t/q58lt5
      Track::Product.new(@product, user: spree_current_user,
                         product_url: product_url(@product), currency: current_currency).product_clicked
    end

end
