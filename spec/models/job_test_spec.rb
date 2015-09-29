require 'rails_helper'

RSpec.describe JobTest, type: :model do
  it "is valid with a title, description and file" do
    job_test = JobTest.new(
        title: 'Ruby developer jobtest',
        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                      cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                      proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        file: 'path to file string'
    )
    expect(job_test).to be_valid
  end
  it "is invalid without a title" do
    job_test = JobTest.new(title: nil)
    job_test.valid?
    expect(job_test.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a description" do
    job_test = JobTest.new(description: nil)
    job_test.valid?
    expect(job_test.errors[:description]).to include("can't be blank")
  end
end
