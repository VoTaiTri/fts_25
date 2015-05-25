require "rails_helper"

RSpec.describe "admins/questions/index", type: :view do
  before :each do
    10.times do
      FactoryGirl.create :question
    end
    @questions = Question.all.paginate page: params[:page], per_page: Settings.page_size
  end

  it "display the title of index questions" do
    render
    expect(rendered).to include "All Question"
  end

  it "request to questions controller and index action" do
    assign :questions, @questions
    render
    expect(controller.request.path_parameters[:controller]).to eq "admins/questions"
    expect(controller.request.path_parameters[:action]).to eq "index"
  end

  it "display the questions partial for questions info" do
    assign :questions, @questions
    render
    expect(view).to render_template partial: "admins/questions/_question"
  end
end
