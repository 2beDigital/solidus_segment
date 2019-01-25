Spree::UserRegistrationsController.class_eval do

  after_action :segment_complete_registration, only: :create, if: -> { flash[:notice] }

  def segment_complete_registration
    Track::User.new(@user, request).logged_in_event('CompleteRegistration',
                                                    {currency: current_currency,
                                                     value: current_order(create_order_if_necessary: true).total,
                                                     content_name: request.path
                                                    })
  end
end
