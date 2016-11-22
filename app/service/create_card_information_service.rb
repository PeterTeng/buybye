class CreateCardInformationService
  def self.call(user)
    card_information = ActiveSupport::JSON.decode("#{user.stripe_customer.sources}")["data"].first
    card_information_params = {
      card_owner: card_information["name"],
      brand_name: card_information["brand"],
      country: card_information["country"],
      last_4_number: card_information["last4"]
    }
    user.create_card_information card_information_params
    NotifySlackWorker.new.perform("[Stripe] new user", ":moneybag:", "#{user.email}")
  end
end
