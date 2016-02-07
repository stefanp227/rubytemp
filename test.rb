require 'serialport'
require 'sinatra'

SP = SerialPort.new("/dev/ttyACM1", 9600, 8, 1, SerialPort::NONE)

get '/' do
  erb :index, :locals => {:sp => SP.readline("\r")}
end

