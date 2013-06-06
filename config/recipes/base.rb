def template(from, to)
	erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
	put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
	set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
	desc "Install everything unto the server"
	task :install do
		run "#{sudo} apt-get -y update"
		run "#{sudo} apt-get -y install python-software-properties"
	end

	#custom tasks
	#override the default deploy:cold
	task :cold do
		update
		load_schema			#override the default migrations, use schema
		start
	end

	task :load_schema, :roles => :app do
		run "cd #{current_path}; RAILS_ENV=production rake db:schema:load"
		run "cd #{current_path}; RAILS_ENV=production rake db:seed"	#added by me
	end

end