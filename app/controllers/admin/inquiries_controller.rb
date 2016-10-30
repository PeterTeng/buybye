class Admin::InquiriesController < Admin::BaseController

  def index
    @inquiries = Inquiry.includes(:user).all
  end

  def acknowledged
    inquiry  = Inquiry.find params[:id]
    inquiry.update(
      is_acknowledged: true
    )
    redirect_to :back, flash: {success: "お問い合わせ対応おつかれさまです"}
  end

end
