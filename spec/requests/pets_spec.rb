# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/pets', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Pet. As you add validations to Pet, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip('Add a hash of attributes valid for your model')
  }

  let(:invalid_attributes) {
    skip('Add a hash of attributes invalid for your model')
  }

  describe 'GET /index' do
    it 'renders a successful response' do
      Pet.create! valid_attributes
      get pets_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      pet = Pet.create! valid_attributes
      get pet_url(pet)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_pet_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      pet = Pet.create! valid_attributes
      get edit_pet_url(pet)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Pet' do
        expect {
          post pets_url, params: { pet: valid_attributes }
        }.to change(Pet, :count).by(1)
      end

      it 'redirects to the created pet' do
        post pets_url, params: { pet: valid_attributes }
        expect(response).to redirect_to(pet_url(Pet.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Pet' do
        expect {
          post pets_url, params: { pet: invalid_attributes }
        }.to change(Pet, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post pets_url, params: { pet: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { skip('Add a hash of attributes valid for your model') }

      it 'updates the requested pet' do
        pet = Pet.create! valid_attributes
        patch pet_url(pet), params: { pet: new_attributes }
        pet.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the pet' do
        pet = Pet.create! valid_attributes
        patch pet_url(pet), params: { pet: new_attributes }
        pet.reload
        expect(response).to redirect_to(pet_url(pet))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        pet = Pet.create! valid_attributes
        patch pet_url(pet), params: { pet: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested pet' do
      pet = Pet.create! valid_attributes
      expect { delete pet_url(pet) }.to change(Pet, :count).by(-1)
    end

    it 'redirects to the pets list' do
      pet = Pet.create! valid_attributes
      delete pet_url(pet)
      expect(response).to redirect_to(pets_url)
    end
  end
end
