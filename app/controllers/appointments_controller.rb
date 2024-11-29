# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]

  def index
    @appointments = Appointment.all
  end

  def show; end

  def new
    @appointment = Appointment.new
  end

  def edit; end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.client = current_user

    return render :new, status: :unprocessable_entity unless @appointment.save

    redirect_to @appointment, notice: 'Appointment was successfully created.'
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
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
    params.expect(
      appointment:
        %I[status appointment_type_id start_at end_at pet_id notes]
    )
  end
end
