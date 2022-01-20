class PaymentsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @payments = Payment.all
  end
end
