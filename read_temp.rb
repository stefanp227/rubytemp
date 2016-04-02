require 'serialport'

SP = SerialPort.new("/dev/ttyACM3", 9600, 8, 1, SerialPort::NONE)
require 'sinatra/activerecord'


ActiveRecord::Base.establish_connection(
	adapter: 'sqlite3',
	database: 'ruby_tmp.sqlite3.db'
)
class TempReading < ActiveRecord::Base
end

while(true)
	sp = SP.readline("\r")
	TempReading.create!(temp: sp, read_at: Time.now)
	sleep(30)	
end