require 'rails_helper'

RSpec.describe API::V1::MedicalConditionsController, type: :controller do
	before do
		@admin_user = FactoryGirl.create(:admin_user)
		request.accept = 'application/json'
		request.headers['CONTENT_TYPE'] = 'application/json'
		request.headers["HTTP_X_ADMIN_APIKEY"] = @admin_user.apikey
		@veteran = FactoryGirl.create(:veteran)
	end

  #index
  it 'should retrieve medical conditions' do
    @veteran.medical_conditions = FactoryGirl.create_list(:medical_condition, 10)
    get :index, person_id: @veteran.id

    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json.length).to eq(10)
  end

  # Create
  it 'creates a veteran\'s medical condition' do
		post :create, person_id: @veteran.id, medical_condition: FactoryGirl.attributes_for(:medical_condition)

		expect(response).to be_success
		json = JSON.parse(response.body)
		expect(json["id"]).to be_a(Integer)
  end

  # Update
  # it 'updates a medical condition' do
  # 	# medical_condition = FactoryGirl.create(:medical_condition)
  # 	# attr = { description: "other_activititities" }
  # 	# put :update, id: medical_condition.id, medical_condition: attr
  # 	# medical_condition.reload

  # 	# expect(response).to be_success
  # 	# expect(medical_condition.description).to eql(attr[:description])
  # end

  # Delete
  it 'deletes the medical condition' do
    mc = FactoryGirl.create(:medical_condition)
    delete :destroy, id: mc.id
    expect(MedicalCondition.count).to eq(0)
  end

end
