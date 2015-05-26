require "rails_helper"

RSpec.describe "route for Subject", type: :routing do

  it "routes admin_subject_path to subjects controller and shown action" do
    @subject = FactoryGirl.create :subject
     expect(get: admins_subject_path(@subject)).
       to route_to controller: "admins/subjects", action: "show", id: "#{@subject.id}"
  end

  it "routes admins_subjects_path to subjects controller and index action" do
     expect(get: admins_subjects_path).
       to route_to controller: "admins/subjects", action: "index"
  end

  it "routes new_admins_subject_path to subjects controller and new action" do
     expect(get: new_admins_subject_path).
       to route_to controller: "admins/subjects", action: "new"
  end

  it "routes admins_subject_path to subjects controller and create action" do
     expect(post: admins_subjects_path).
       to route_to controller: "admins/subjects", action: "create"
  end

  it "routes admin_subject_path to subjects controller and edit action" do
    @subject = FactoryGirl.create :subject
     expect(get: edit_admins_subject_path(@subject)).
       to route_to controller: "admins/subjects", action: "edit", id: "#{@subject.id}"
  end

  it "routes admins_subjects_path to subjects controller and update action" do
    @subject = FactoryGirl.create :subject
     expect(patch: admins_subject_path(@subject)).
       to route_to controller: "admins/subjects", action: "update", id: "#{@subject.id}"
  end
  it "routes admin_subject_path to subjects controller and destroy action" do
    @subject = FactoryGirl.create :subject
     expect(delete: admins_subject_path(@subject)).
       to route_to controller: "admins/subjects", action: "destroy", id: "#{@subject.id}"
  end
end
