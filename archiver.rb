#tempfile, utils and find

file = File.new('practice-day4.txt', 'w+')
file.puts("This is a new file")
file.close

#implement three methods for opening files for reading, writing and both modes
def read_a_file file_path
  p File.read(file_path)
end
#This method overwrite what the file had before
def wirte_in_a_file file_path, text
  File.open(file_path,'w'){ |f| f.write(text)}
end

#This method append text to the one that was before
def append_text file_path, text
  File.open(file_path,'a'){ |f| f.puts(text)}
end

read_a_file("practice-day4.txt")
wirte_in_a_file("practice-day4.txt","Nuevo texto en el archivo")
append_text("practice-day4.txt","Complementando el texto de mi archivo")
read_a_file("practice-day4.txt")