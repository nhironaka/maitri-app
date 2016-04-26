class PatientsController < ApplicationController
    helper_method :sort_column, :sort_direction
    include ApplicationHelper
    def patient_params
        params.require(:patient).permit(:two, :three, :sixteen, :seventeen)
    end
    
    def index
       @patients = Patient.all
      if sort_column and sort_direction
        @patients = @patients.order(sort_column + " " + sort_direction)
      end
      if not start_date.nil? and not start_date.empty?
        @patients = @patients.where('sixteen > ?', start_date)
      end
      if not end_date.nil? and not end_date.empty?
        @patients = @patients.where('seventeen < ?', end_date)
      end
    end
    
    def show
      import = params[:import]
      if import
        render "import_view"
        return
      end
      @patient = Patient.find(params[:id])
    end
    
    def reports
      @patients = Patient.all
      report = RubyXL::Workbook.new
      worksheet = report.add_worksheet('Sheet1')
      filters = Hash.new()
      records = 0;
      for i in 1..5
        filter =params["#{i}th_filter".to_sym]
        cond = params["#{i}th_condition".to_sym]
        val = params["value#{i}".to_sym]
        if !filter.nil?
          k = @@map[filter]
          if cond == "less_than"
            @patients = @patients.where("? > #{k}", "#{val}%")
          elsif cond == "greater_than"
            @patients = @patients.where("#{k} > ?", "#{val}%")
          else 
            @patients = @patients.where("#{k} LIKE ?", "#{val}%")
          end
          len = @patients.length
          filters[filter] = [val, (records - len).abs]
          records = len
        else
          break
        end
      end
      worksheet.add_cell(0, 0, 'A1')
      report.write("./report.xlsx")
    end
      
    def import_excel
      Patient.delete_all
      file = params[:file]
      patients_sheets = Roo::Spreadsheet.open(file)
      patients_sheets.each_with_pagename do |_name, sheet|
        sheet.drop(1).each do |row|
          attrbs = {}
          i=1;
          row.each do |val|
            key = i.to_words.split(/[-|\s]/).join('_').to_sym
            attrbs[key]=val
            i += 1
          end
          Patient.create!(attrbs)
        end
      end
      redirect_to patients_overview_path(params)
    end  
    
    private
  
    def sort_column
      params[:sort]
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
    def start_date
      params[:start_date]
    end
    
    def end_date
      params[:end_date]
    end
end