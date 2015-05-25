require "rails_helper"

RSpec.describe "examinations/_examination", type: :view do  
  before :each do
    @examination = FactoryGirl.create :examination
  end
  it "display the _examination partial" do
    render "examinations/examination", examination: @examination
    expect(rendered).to include @examination.subject.name
  end
end
