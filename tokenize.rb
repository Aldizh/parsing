#!/usr/bin/ruby
require "csv"

puts "message_id,token"
csv_out = CSV.new($stdout, :headers=>true, :write_headers=>true)
CSV($stdin, {:headers => true}) do |csv|
  csv.each do |rrow|
    text = rrow["body"]
      text.downcase.split(/[[:^alpha:]]/).each do |tok|
        csv_out << CSV::Row.new(["message_id", "token"], [rrow["message_id"], tok]) unless tok == ""
      end
  end
end
