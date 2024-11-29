# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pets/edit', type: :view do
  let(:pet) {
    Pet.create!(
      name: 'MyString',
      bred: 'MyString',
      kind: 1,
      user: nil
    )
  }

  before(:each) do
    assign(:pet, pet)
  end

  it 'renders the edit pet form' do
    render

    assert_select 'form[action=?][method=?]', pet_path(pet), 'post' do
      assert_select 'input[name=?]', 'pet[name]'

      assert_select 'input[name=?]', 'pet[bred]'

      assert_select 'input[name=?]', 'pet[kind]'

      assert_select 'input[name=?]', 'pet[user_id]'
    end
  end
end
