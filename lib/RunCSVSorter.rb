require_relative 'CSVSorter'

c = CSVSorter::Methods.new
print 'Please enter the file path of the CSV file you would like to sort: '
file_path = gets.chomp
original_file = c.get_csv_file(file_path)
unless original_file.nil? 
    sorted_file = c.sort_last_first(original_file)
    c.output_csv_file(sorted_file, file_path)
end
