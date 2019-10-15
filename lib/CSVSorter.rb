require 'csv'

module CSVSorter
  class Methods
    @file_path
    
    def run
      orignial_file = get_csv_file
      sorted_file = sort_last_first(orignial_file)
      output_csv_file(sorted_file, @file_path)
    end

    #Read CSV file into an array
    def get_csv_file
      print 'Please enter the file location of the CSV you would like to sort: '
      @file_path = gets.chomp

      #Simple error check if the file is CSV
      if !@file_path.include? '.csv'
        print "\nPlease enter a CSV file"
        nil
      else
        CSV.parse(File.read(@file_path), headers: true)
      end
    end

    #Write data to CSV file
    def output_csv_file(csv_array, file_path)
      CSV.open(file_path, "w") do |csv|
        csv << ['First Name', 'Last Name', 'Zip Code']
        csv_array.each { |r| csv << r } 
      end
    end

    #Sort CSV file by last name and then first name
    def sort_last_first(csv_array)
      csv_array.sort_by { |t| [t['Last Name'].downcase, t['First Name'].downcase] }
    end
  end
end
