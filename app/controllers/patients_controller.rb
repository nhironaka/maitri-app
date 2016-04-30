class PatientsController < ApplicationController
    helper_method :sort_column, :sort_direction
    include ApplicationHelper
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
    
    @@filters = Hash.new()
    
    
    public
    @@inequality = {"less_than"=>"< ", "greater_than"=>"> ", "equal"=>""}
    
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
      id=params[:id]
      @patient = Patient.find(id)
    end
    
    def reports
      @patients = Patient.all
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
          if @@filters.key?(filter)
            @@filters[filter] = @@filters[filter].concat(["#{@@inequality[cond]}#{val}", (records - len).abs])
          else
            @@filters[filter] = [["#{@@inequality[cond]}#{val}", (records - len).abs]]

          end
          records = len
        else
          break
        end
      end
    end
    
    def download
      if !@@filters.nil? and !@@filters.empty?
        report = RubyXL::Workbook.new
        worksheet = report.add_worksheet('Sheet1')
        row=1
        
        @@filters.keys.each { |key|
          worksheet.add_cell(row, 0, key.split("_").join(" "))
          column = 1
          @@filters[key].each{ |item|
            worksheet.add_cell(row-1, column, item[0])
            worksheet.add_cell(row, column, item[1])
            column = column + 1
          }
          row = row + 3
        }
        send_data report.stream.string.bytes.to_a.pack("C*"), :disposition=>"attachment", :filename=>"report.xlsx"
        return
      end
      redirect_to patient_reporting_path()
    end
    
    def import_excel
      Patient.delete_all
      file = params[:file]
      accepted_format = [".xlsx", "xls"]
      if file == nil or not accepted_format.include? File.extname(file.original_filename)
        flash[:notice] = "File type must be an Excel"
        redirect_to patients_import_view_path(:import => true)
        return
      end
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
      
end