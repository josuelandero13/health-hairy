require 'rails_helper'

RSpec.describe "locals/index", type: :view do
  before(:each) do
    assign(:locals, [
      Local.create!(
        city: nil,
        address: "MyText"
      ),
      Local.create!(
        city: nil,
        address: "MyText"
      )
    ])
  end

  it "renders a list of locals" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
