class CitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!
  before_action :set_city, only: %i[show edit update destroy]

  # GET /cities or /cities.json
  def index
    @cities = City.all
  end

  def show; end

  def new
    @city = City.new
  end

  def edit; end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to @city, notice: 'City was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @city.update(city_params)
      redirect_to @city, notice: 'City was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /cities/1 or /cities/1.json
  def destroy
    @city.destroy!

    redirect_to cities_path, status: :see_other, notice: 'City was successfully destroyed.'
  end

  private

  def set_city
    @city = City.find(params.expect(:id))
  end

  def city_params
    params.expect(city: %i[name])
  end
end
