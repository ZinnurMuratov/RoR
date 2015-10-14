require 'csv'


class Users
  def initialize(inFile)
    @inFile = inFile
  end

  def sort_csv_by(type)
    if (type == 'name')
      @inFile.sort! { |a, b| a[0].to_s <=> b[0].to_s }
    end
    if (type == 'age')
      @inFile.sort! { |a, b| a[1].to_s <=> b[1].to_s }
    end
    if (type == 'city')
      @inFile.sort! { |a, b| a[2].to_s <=> b[2].to_s }
    end
  end

  def OutIt(filename,header)
    CSV.open(filename, "wb") do |csv|
      csv << header
      @inFile.each { |line| csv << line }
    end
  end

end

my_csv = CSV.read 'data.csv'
header = my_csv[0]
my_csv.shift
users = Users.new(my_csv)
users.sort_csv_by('age')
users.OutIt('output.csv',header)





