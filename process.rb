#!/usr/bin/env ruby
# foo | ./myscript 8 100 5

column = ARGV[0]
threshold = ARGV[1]
max_occurence = ARGV[2]
puts "column: #{column}"
puts "threshold: #{threshold}"
puts "max_occurence: #{max_occurence}"

def forbidden?(columns, column, threshold)
    columns[column.to_i - 1].to_i >= threshold.to_i
end

header = true
occurence = 0
STDIN.read.split("\n").each do |line|
  unless header
    columns = line.split
    if forbidden?(columns, column, threshold)
      occurence += 1
      STDERR.puts "Warn!!! the #{column}th data has been exeded the value of #{threshold} by #{occurence} times" if occurence >= max_occurence.to_i
    end
  end
  header = false
end
