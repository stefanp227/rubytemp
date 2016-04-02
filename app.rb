require 'serialport'
require 'sinatra'
require 'sinatra/activerecord'

SP = SerialPort.new("/dev/ttyACM3", 9600, 8, 1, SerialPort::NONE)

ActiveRecord::Base.establish_connection(
	adapter: 'sqlite3',
	database: 'ruby_tmp.sqlite3.db'
)

class TempReading < ActiveRecord::Base
end



get '/' do
	@temp = TempReading.pluck(:temp)
	@read_at = TempReading.pluck(:read_at).map { |x| x.strftime("%I:%M:%S")}

  erb :index
end
