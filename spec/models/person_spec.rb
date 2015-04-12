require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should have_many(:service_histories) }
  it { should have_one(:address) }
  it { should validate_presence_of(:birth_date) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should belong_to(:war) }
  it { should have_many(:service_awards) }
  it { should belong_to(:shirt_size) }
  it { should belong_to(:day_of_flight)}
  it { should have_many(:contacts)}


  describe "#uuid" do
    subject(:person) { FactoryGirl.create(:person) }
    it "assigns a uuid" do
      expect(person.uuid.length).to be_between(20, 200)
    end
  end

  describe "#application_date" do
    describe "auto-generated" do
      it "should use created_at" do
        p = FactoryGirl.create(:person)
        expect(p.application_date).to eql(p.created_at.to_date)
      end
    end

    describe "manual-input" do
      it "should not use created_at" do
        p = FactoryGirl.create(:person, application_date: Date.today - 3.days)
        expect(p.application_date).not_to eql(p.created_at.to_date)
      end
    end
  end
end
