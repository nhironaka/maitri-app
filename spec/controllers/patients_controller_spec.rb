require 'spec_helper'


RSpec.describe PatientsController, :type => :controller do
	let(:user) {create(:user, email: "ayushincnca@gmail.com", password: "hellohello")}
	before { controller.stub(:current_user) { user } }
	
	#let(:current_patient) {create(:patient, name: "Tester", gender: "M", start_date: "1991-Jan-12", end_date: "1992-Jan-31")}
		
    describe "GET #index" do
		it 'shows all patients' do
			get :index
			expect(response.status).to eq(200)
		end
	end
	
	# describe "GET #sort_column" do
	# 	it 'sorts all patients by column' do	
	# 		PatientsController.sort_column 
	# 		expect(response.status).to eq(200)
	# 	end
	# end
	
	# describe "GET #sort_direction" do
	# 	it 'sorts by direction' do	
	# 		#get :sort_direction
	# 		expect(response.status).to eq(200)
	# 	end
	# end
	
	
end
