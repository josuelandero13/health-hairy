# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]

  def index
    @pagy, @appointments = pagy(
      FindAppointments.new.call(appointment_params_index), items: 10
    )
  end

  def show; end

  def new
    @appointment = Appointment.new
    @appointment_type = AppointmentType.find_by(id: params[:appointment_type])
    @appointment.payments.build
  end

  def edit; end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.client = current_user
    @appointment_type = AppointmentType.find(
      params[:appointment][:appointment_type_id]
    )

    return render :new, status: :unprocessable_entity unless @appointment.save

    redirect_to @appointment, notice: 'Appointment was successfully created.'
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: 'Appointment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy!
    messafe_notice = 'Appointment was successfully destroyed.'

    redirect_to appointments_path, status: :see_other, notice: messafe_notice
  end

  private

  def set_appointment
    @appointment = Appointment.find(params.expect(:id))
  end

  def appointment_params
    params.require(:appointment).permit(
      :status, :appointment_type_id,
      :start_at, :end_at,
      :notes, :pet_id, :local_id,
      payments_attributes: %i[id billing_status user_id receipt _destroy]
    )
  end

  def appointment_params_index
    params.permit(:query_text, :order_by, :status)
  end
end
