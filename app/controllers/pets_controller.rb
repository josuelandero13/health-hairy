# frozen_string_literal: true

class PetsController < ApplicationController
  before_action :set_pet, only: %i[show edit update destroy]

  def index
    @pets = Pet.all
  end

  def show; end

  def new
    @pet = Pet.new
  end

  def edit; end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id

    return redirect_to @pet, notice: 'Pet was successfully created.' if @pet.save

    render :new, status: :unprocessable_entity
  end

  def update
    return redirect_to @pet, notice: 'Pet was successfully updated.' if @pet.update(pet_params)

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @pet.destroy!

    redirect_to pets_path, status: :see_other, notice: 'Pet was successfully destroyed.'
  end

  private

  def set_pet
    @pet = Pet.find(params.expect(:id))
  end

  def pet_params
    params[:pet][:kind] = params[:pet][:kind].to_i if params[:pet][:kind].present?

    params.expect(pet: %I[name bred kind user_id photo important_notes])
  end
end
