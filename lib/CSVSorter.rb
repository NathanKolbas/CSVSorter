require 'csv'

module CSVSorter
  class Methods
    #Read CSV file
    def get_csv_file(file_path)
      #Simple error check if the file is CSV
      if !file_path.include? '.csv'
        print "\nPlease enter a CSV file"
      else
        CSV.parse(File.read(file_path), headers: true)
      end
    end

    #Write data to CSV file
    def output_csv_file(csv_data, file_path)
      CSV.open(file_path, "w") do |csv|
        csv << ['First Name', 'Last Name', 'Zip Code']
        csv_data.each { |r| csv << r } 
      end
    end

    #Sort CSV file by last name and then first name
    def sort_last_first(csv_data)
      csv_data.sort_by { |t| [t['Last Name'].downcase, t['First Name'].downcase] }
    end
  end
end
