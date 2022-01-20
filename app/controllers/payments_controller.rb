class PaymentsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @payments = Payment.all.order(created_at: :desc)
  end

  def new
    @payment = Payment.new
    @category = Category.find(params[:category_id])
  end

  def create
    if Payment.new(payment_params).invalid?
      flash[:notice] = 'The payment was not saved for incorrect data'
      redirect_to '/categories/new/'
    else
      @payment = Payment.create!(payment_params)
      respond_to do |format|
        format.html do
          if @payment.save
            # success message
            flash[:success] = 'Payment saved successfully'
            # redirect to index
            redirect_to "/payments/#{params[:category_id]}"
          else
            # error message
            flash.now[:error] = 'Error: Payment could not be saved'
            # render new
            render :new, locals: { payment: @payment }
          end
        end
      end
    end
  end

  def delete
    @payment = Payment.find(params[:id])
    if @payment.destroy
      flash[:success] = 'payment destroyed successfully'
    else
      flash[:error] = 'Error: payment could not be destroyed'
    end
    redirect_back(fallback_location: payments_path)
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :author_id, :category_id, :amount)
  end
end
