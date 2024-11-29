# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pets/new', type: :view do
  before(:each) do
    assign(:pet, Pet.new(
      name: 'MyString',
      bred: 'MyString',
      kind: 1,
      user: nil
    ))
  end

  it 'renders new pet form' do
    render

    assert_select 'form[action=?][method=?]', pets_path, 'post' do

      assert_select 'input[name=?]', 'pet[name]'

      assert_select 'input[name=?]', 'pet[bred]'

      assert_select 'input[name=?]', 'pet[kind]'

      assert_select 'input[name=?]', 'pet[user_id]'
    end
  end
end
