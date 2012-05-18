require "rubygems"
require "roo"
module Import_excel
  #file_name 文件名称
  #sheet_line 需要导入的sheet，及每张sheet开始的行号如 {:Sheet1=>1,:Sheet2=>3}
  #col_belong 每列对应的属性 如{:name=>"A"}
  def import(file_name,col_belong,sheet_line={:Sheet1=>1})
    file_path= File.dirname(File.expand_path("_FILE_"))+"/"+file_name
   unless FileTest::exist?(file_path)
      #"文件不能为空"
      return false
    end
    unless File.ftype(file_path)=="file"
      #"不是文件"
      return false
    end
 
    file_extend_name = file_name.split('.').last
    case file_extend_name
      when "xls"
        xls = true
      when "xlsx"
        xlsx = true
      else
        xls = xlsx = false
     end

      if xls  == false && xlsx == false
       #"文件不是excel文件"
       return false
      end

      if xls
       @excel_file=Excel.new(file_path)
      end
      if xlsx
        @excel_file=Excelx.new(file_path)
      end

       @excel_file.sheets.each do |sheet|
          if sheet_line.key? sheet.to_sym
            @excel_file.default_sheet = sheet
            start_line= sheet_line[sheet.to_sym]
            start_line.upto(@excel_file.last_row) do |line|
              puts start_line
              start_line+=1
              rec=self.new
              col_belong.each do |key, value|
                cellval=@excel_file.cell(line,value)
                rec[key]=cellval unless cellval.nil?
                puts rec[key]
              end
              rec.save!
              puts " "              
            end
          end
       end
      return true
  end 



end
