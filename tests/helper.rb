require 'mechanize'
require 'launchy'
require	'test/unit'
require 'capybara'
require 'capybara/mechanize'
require 'capybara/dsl'
require 'capybara-webkit'
Capybara.run_server = false
Capybara.current_driver = :webkit
Capybara.app_host = "http://google.com/"

class IHomeTest < Test::Unit::TestCase
	def debug_page(body)
		`mkdir -p /tmp/ihome`
		file = File.new("/tmp/ihome/#{Time.now.to_i}.html", 'w')
        file.write body
        Launchy.open "file://#{file.path}"
	end

	def setup
		@agent= Mechanize.new
	end

	def teardown
		`rm -rf /tmp/ihome`
	end

	def get_home_page
		@agent.get('http://ihomefinder.com/')

	end

  def get_op_page
    @agent.get('http://59736.ihf-omnipress.com/')
  end

end