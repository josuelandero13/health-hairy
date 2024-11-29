# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pets/show', type: :view do
  before(:each) do
    assign(:pet, Pet.create!(
      name: 'Name',
      bred: 'Bred',
      kind: 2,
      user: nil
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Bred/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
