require 'rails_helper'

RSpec.describe Project, type: :model do
  describe '#validations' do
    it 'is valid if required fields are present' do
      project = build(:project)
      expect(project).to be_valid
      expect(project.errors).to be_empty
    end

    [ #required field
      :title,
    ].each do |required_field|
      it "is invalid if #{required_field} is not present" do
        project = build(:project)
        project.send("#{required_field}=", '')
        expect(project).not_to be_valid
        expect(project.errors).to have_key(required_field)
      end

      it "is invalid if #{required_field} is set to nil" do
        project = build(:project)
        project.send("#{required_field}=", nil)
        expect(project).not_to be_valid
        expect(project.errors).to have_key(required_field)
      end
    end

    [   #unique field  #value
      :title, 
    ].each do |test_case|
      unique_field, value = test_case

      it "is invalid if #{unique_field} is not unique" do
        project_1 = build(:project)
        project_1.send("#{unique_field}=", value)
        project_1.save

        project_2 = build(:project)
        project_2.send("#{unique_field}=", project_1.send(unique_field))

        expect(project_2).not_to be_valid
        expect(project_2.errors).to have_key(unique_field)
      end
    end
  end
end
