class PatientsController < ApplicationController
    
    def patient_params
        params.require(:patient).permit(:name, :gender, :start_date, :end_date)
    end
    
    def index
        @patients = Patient.all # or any other default handler which returns ActiveRecord::Relation
        
        sort = params[:sort] || session[:sort]
        case sort
            when 'name'
              ordering, @name_header = {:name => :asc}, 'hilite'
            when 'start_date'
              ordering, @start_date_header = {:start_date => :asc}, 'hilite'
            when 'end_date'
              ordering, @end_date_header = {:end_date => :asc}, 'hilite'
        end
        
        if params[:sort] != session[:sort]
          session[:sort] = sort
          redirect_to :sort => sort and return
        end
        
        #Patient.create!(:name=>"A", :gender=>"F", :start_date=>"1/2", :end_date=>"3/10") #@patients.order(ordering) if params[:sort].present? # OR if ordering
        #Patient.create!(:name=>"B", :gender=>"M", :start_date=>"1/2", :end_date=>"3/10") #@patients.order(ordering) if params[:sort].present? # OR if ordering
        
        @patients = Patient.all
    end
    
end