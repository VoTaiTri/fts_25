require "rails_helper"

RSpec.describe "examinations/index", type: :view do
  before :each do
    @user = FactoryGirl.create :user_with_4_examinations
    sign_in :user, @user
    @examinations = @user.examinations.paginate page: params[:page],
                                                per_page: Settings.page_exam_size
  end
  it " request to examinations controller and index action" do
    assign :examinations, @examinations
    render
    expect(controller.request.path_parameters[:controller]).to eq "examinations"
    expect(controller.request.path_parameters[:action]).to eq "index"
  end

  it "contain form which have list of subject for user create exam" do
    render
    expect(rendered).to include Subject.first.name, Subject.last.name
  end

  it "display the _examination partial for each examination" do
    assign :examinations, @examinations
    render
    expect(view).to render_template partial: "_examination",
                                    count: @user.examinations.count
  end
end
