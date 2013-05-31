#!/usr/bin/ruby
require "csv"

curtok = nil
count = 1
puts "token,count"
CSV do |csv_out|
  CSV($stdin) do |csv|
    csv.each do |rrow|
      if rrow[1] == curtok
        count += 1
      else
        csv_out << CSV::Row.new(["token", "count"], [curtok, count]) unless curtok.nil?
        curtok = rrow[1]
        count = 1
      end
    end
    # output the last row!
    csv_out << CSV::Row.new(["token", "count"], [curtok, count]) unless curtok.nil?
  end
end
