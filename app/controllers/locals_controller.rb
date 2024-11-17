# frozen_string_literal: true

class LocalsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!
  before_action :set_local, only: %i[show edit update destroy]

  def index
    @locals = Local.all
  end

  def show; end

  def new
    @local = Local.new
  end

  def edit; end

  def create
    @local = Local.new(local_params)

    if @local.save
      redirect_to @local, notice: 'Local was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locals/1 or /locals/1.json
  def update
    if @local.update(local_params)
      redirect_to @local, notice: 'Local was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @local.destroy!

    redirect_to locals_path, status: :see_other, notice: 'Local was successfully destroyed.'
  end

  private

  def set_local
    @local = Local.find(params.expect(:id))
  end

  def local_params
    params.expect(local: %I[city_id address])
  end
end
