class InitializerGenerator < Rails::Generators::Base
  def create_initializer_file
  	string = []
  	response  = HTTParty.post("http://localhost:4660/api/apidom_clients/setup",:body => { application_name:Rails.application.class.parent_name,global_app_code:'DNHAWKER',api_key:'227409b54db813eaff34251a73c4aed6'}.to_json,:headers => { 'Content-Type' => 'application/json' } )    
  	data =  JSON[response.body]["data"]
		string << "GLOBAL_APP_CODE ='#{data['global_app_code']}'"
		string << "API_KEY = '#{data['api_key']}'" 
		create_file "config/initializers/apidoms.rb", "#{string.join("\n")}"
  end
end