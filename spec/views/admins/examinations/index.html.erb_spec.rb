require "rails_helper"

RSpec.describe "admins/examinations/index", type: :view do
  before :each do
    3.times do
      FactoryGirl.create :examination
    end
    @examinations = Examination.all.paginate page: params[:page],
                                           per_page: Settings.page_size
  end

  it " request to examinations controller and index action" do
    assign :examinations, @examinations
    render
    expect(controller.request.path_parameters[:controller]).to eq "admins/examinations"
    expect(controller.request.path_parameters[:action]).to eq "index"
  end

  it "contain list of condition value for admin filter the examinations" do
    render
    expect(rendered).to include Settings.status.start, Settings.status.view,
                                Settings.status.corrected
  end

  it "display the _examination partial for all examination on Admin page" do
    assign :examinations, @examinations
    render
    expect(rendered).to render_template partial: "admins/examinations/_examination"
  end
end
