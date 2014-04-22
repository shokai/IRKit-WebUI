if ENV.has_key? 'IRKIT'
  irkit = IRKit::Device.new(address: ENV['IRKIT'])
else
  irkit = IRKit::Device.find.first  
end

unless irkit
  STDERR.puts "irkit not found"
  exit 1
end

get '/' do
  @ir_data = IRKit::App::Data["IR"].keys
end

post '/irkit' do
  name = params[:name]
  ir_data = IRKit::App::Data["IR"][name]
  begin
    irkit.post_messages ir_data
  rescue => e
    STDERR.puts e
  end
end
