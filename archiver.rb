# File System Practice

# This part of the course is intended to show the mentees how to work with files
# inside a Ruby context, the file handling methods will be shown as listed below. The
# practice for this part will be uploaded to this repository, it is recommended to
# overview the File Class documentation when possible.

# The Archiver Class will be implemented. The methods tempfile, utils and find will
#  be referenced and used in comparison with self written methods. Create a new file
#  named archiver.rb, then implement three methods for opening files for
#    - Reading, all the contents of a file and line by line
#    - Writing, overwriting the content of a file or appending what we want
#
#  we want to add at the endmethods for reading all the contents of a file and line by
#  line and finally methods for writing the full content of a file or appending what
#  we want to add at the end. This is the file that should be pushed to the repo.

# Archiver class
class Archiver
  attr_accessor :file

  def initialize(file)
    @file = file
  end

  def read(lines = false)
    # modes [lines, full]
    if lines
      line_num = 1
      File.readlines(file).each do |line|
        print "line #{line_num.to_s.rjust(2, '0')}: "
        puts line
        line_num += 1
      end
    else
      contents = File.read(file)
      print contents

    end
  end

  def write(overwrite = false)
    # overwrite || append
    if overwrite
      puts "'Write the file's new content: '"
      contents = gets
      current_file = File.open(file, 'w') { |f| f.write contents }
    else
      puts 'Write the content to be added'
      contents = gets
      current_file = File.open(file, 'a+') { |f| f.write contents }
    end
  end
end

# -----------------
# Tests
# -----------------

reader = Archiver.new('file.txt')

puts
puts '-----------------'
puts 'Reader tests'
puts '-----------------'
puts

reader.read(true)
puts
reader.read

puts
puts '-----------------'
puts 'Writer tests'
puts '-----------------'
puts

reader.write(overwrite = true)
reader.write

puts
puts 'Results: '
reader.read
