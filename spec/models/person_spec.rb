require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should have_many(:service_histories) }
  it { should have_one(:address) }
  it { should validate_presence_of(:birth_date) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should belong_to(:war) }
  it { should have_many(:medical_conditions) }
  it { should have_many(:service_awards) }

  describe "#uuid" do
    subject(:person) { FactoryGirl.create(:person) }
    it "assigns a uuid" do
      expect(person.uuid.length).to be_between(20, 200)
    end
  end
end
