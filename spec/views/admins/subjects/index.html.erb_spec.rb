require "rails_helper"

RSpec.describe "admins/subjects/index", type: :view do  
  before :each do
    5.times do |n|
      FactoryGirl.create :subject, name: "Ruby on Rails #{n}"
    end
    @subjects = Subject.all.paginate page: params[:page], per_page: Settings.page_size
  end

  it "display the title of index questions" do
    render
    expect(rendered).to include "All Subject"
  end

  it "request to questions controller and index action" do
    render
    expect(controller.request.path_parameters[:controller]).to eq "admins/subjects"
    expect(controller.request.path_parameters[:action]).to eq "index"
  end

  it "display the subject partial for subject info" do
    render
    expect(view).to render_template partial: "admins/subjects/_subject"
  end
end
