if defined?(Spree::StoreController)
  Spree::StoreController.class_eval do
    respond_to :html
    helper Spree::TrackersHelper

    def cvv
      render layout: false
    end

  end
end
