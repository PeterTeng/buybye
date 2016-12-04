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
    text = "name: #{card_information_params[:card_owner]}, ブランド名: #{card_information_params[:brand_name]}, 国: #{card_information_params[:country]}, 最後の4桁: #{card_information_params[:last_4_number]}"
    NotifySlackWorker.new.perform("[Stripe] new user", ":moneybag:", text)
  end
end
