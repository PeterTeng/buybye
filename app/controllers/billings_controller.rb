class BillingsController < ApplicationController

  def create
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
    current_user.update stripe_cus_id: customer.id
    CreateCardInformationService.call current_user
    redirect_to :back
  end

  def settle
    service = Service.find(params[:billing][:service_id])
    billing = CreateBillingService.call(service, current_user, service.currency.to_sym)
    SettleBillingService.call(billing)
    redirect_to finish_settlement_billing_path, flash: {success: t('views.stripe.successfully_settled')}
  end

  def finish_settlement
  end

  private def billing_params
    params.
      require(:billing).
        permit(
          :user_id,
          :service_id,
          :charge_id,
          :amount,
          :currency,
          :is_paid,
        )

  end

end
