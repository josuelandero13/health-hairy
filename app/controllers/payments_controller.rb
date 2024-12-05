# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!
  before_action :set_payment, only: %i[show edit update destroy]

  def index
    @payments = Payment.all
  end

  def show; end

  def new
    @payment = Payment.new
  end

  def edit; end

  def create
    @payment = Payment.new(payment_params)

    return render :new, status: :unprocessable_entity unless @payment.save

    redirect_to @payment, notice: 'Payment was successfully created.'
  end

  def update
    return render :edit, status: :unprocessable_entity unless @payment.update(payment_params)

    redirect_to @payment, notice: 'Payment was successfully updated.'
  end

  def destroy
    @payment.destroy!

    redirect_to payments_path, status: :see_other, notice: 'Payment was successfully destroyed.'
  end

  private

  def set_payment
    @payment = Payment.find(params.expect(:id))
  end

  def payment_params
    params.expect(payment: %i[billing_status user_id appointment_id receipt])
  end
end
