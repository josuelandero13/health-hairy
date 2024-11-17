# frozen_string_literal: true

class AppointmentTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!
  before_action :set_appointment_type, only: %i[show edit update destroy]

  def index
    @appointment_types = AppointmentType.all
  end

  def show; end

  def new
    @appointment_type = AppointmentType.new
  end

  def edit; end

  def create
    notices_create_appointment_type =
      t('appointment_types.actions.create.appointment_type_created')
    @appointment_type = AppointmentType.new(appointment_type_params)
    @appointment_type = @appointment_type.user_id = current_user.id

    return render :new, status: :unprocessable_entity unless @appointment_type.save

    redirect_to @appointment_type, notice: notices_create_appointment_type
  end

  def update
    notices_update_appointment_type =
      t('appointment_types.actions.update.appointment_type_updated')

    if @appointment_type.update(appointment_type_params)
      redirect_to @appointment_type, notice: notices_update_appointment_type
    else
      render :edit, status: :unprocessable_entityunless
    end
  end

  # DELETE /appointment_types/1 or /appointment_types/1.json
  def destroy
    notices_destroy_appointment_type =
      t('appointment_types.actions.destroy.appointment_type_destroyed')

    @appointment_type.destroy!
    redirect_to appointment_types_path, status: :see_other, notice: notices_destroy_appointment_type
  end

  private

  def set_appointment_type
    @appointment_type = AppointmentType.find(params.expect(:id))
  end

  def appointment_type_params
    params.expect(appointment_type: %i[payment_required name user_id price description])
  end
end
