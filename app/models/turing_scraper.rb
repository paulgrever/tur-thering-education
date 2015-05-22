require 'open-uri'
class TuringScraper
  attr_reader :page, :current_cohorts
  def initialize
    turing_base = "http://today.turing.io/outlines/"
     # todays_date = Date.today.strftime("%Y-%m-%d")
      todays_date = "2015-04-15"
    full_url = turing_base + todays_date
    @page = Nokogiri::HTML(open(full_url))
  end

  def find_cohorts
    @current_cohorts = page.css('h2')
  end

  def find_topics
    page.css('h3')
  end

  def cohorts_and_topics
    page.css('h2,h3')
  end
end