#!/usr/bin/ruby
require "mail"
require "find"
require "csv"

def parse_msg(filename)
  mail = Mail.read(filename)
  return nil if mail.from.nil?
  tup = []
  tup << filename
  tup << mail.from  #=> ['mikel@test.lindsaar.net', 'ada@test.lindsaar.net']
  tup << mail.to   #=> 'bob@test.lindsaar.net'
  tup << mail.cc    #=> 'sam@test.lindsaar.net'
  tup << mail.subject         #=> "This is the subject"
  tup << mail.date.to_s       #=> '21 Nov 1997 09:55:06 -0600'
  tup << mail.message_id      #=> '<4D6AA7EB.6490534@xxx.xxx>'
  tup << mail.body.decoded    #=> 'This is the body of the email...
  return tup
end

def parse_files(dir)
  header = ["file_name", "from","to", "cc", "subject", "date", "message_id", "body"]
  puts header.to_csv
  Find.find(dir) do |path|
    if path.split('.')[-1] == 'txt' and not FileTest.directory?(path)
      msg = parse_msg(path)
      unless msg.nil? then
        begin
          puts msg.to_csv unless msg.nil?
        rescue
          puts "parse failure on file #{path}"
        end  
      end
    end
  end
end

parse_files(ARGV[0])

