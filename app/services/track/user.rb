# app/services/track/user.rb
class Track::User
  def initialize(user, request = {})
    @user = user
    @request = request

  end

  def logged_in_event(event, properties = {})
    identify_user
    Analytics.track(
        user_id: @user.id,
        event: event,
        properties: properties
    )
  end

  def logged_in
    identify_user
    Analytics.track(
        user_id: @user.id,
        event: 'Sign In User',
        context: { ip: @user.current_sign_in_ip, userAgent: @request.user_agent }
    )
  end

  def identify_user
    Analytics.identify(
        user_id: @user.id,
        context: { ip: @user.current_sign_in_ip, userAgent: @request.user_agent },
        traits: { email: @user.email,
                  logins: @user.sign_in_count
                }.tap do |hash|
                  if @user.ship_address_id.present?
                    begin
                      last_address = Spree::Address.find_by(id: @user.ship_address_id)
                      hash[:firstName] = last_address.try(:firstname)
                      hash[:lastName] = last_address.try(:lastname)
                      hash[:phone] = last_address.try(:phone)
                    rescue => ex
                      logger.error ex.message
                    end
                  end
                end
    )
  end

end