if ENV.has_key? 'IRKIT'
  irkit = IRKit::Device.new(address: ENV['IRKIT'])
else
  irkit = IRKit::Device.find.first  
end

p irkit

unless irkit
  STDERR.puts "irkit not found"
  exit 1
end

get '/style.css' do
  scss :style
end

get '/' do
  haml :index
end

post '/post_message' do
  name = params[:name]
  ir_data = IRKit::App::Data["IR"][name]
  begin
    irkit.post_messages ir_data
  rescue => e
    STDERR.puts e
    halt 500, e.message
  end
end
