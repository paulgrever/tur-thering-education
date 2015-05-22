require 'open-uri'
class TuringScraper
  attr_reader :page, :current_cohorts
  def initialize
    turing_base = "http://today.turing.io/outlines/"
        # todays_date = Date.today.strftime("%Y-%m-%d")
        todays_date = "2015-04-15"
        # todays_date = "2015-02-09"
    full_url = turing_base + todays_date
    @page = Nokogiri::HTML(open(full_url))
  end

  def find_cohorts
    page.css('h2')
  end

  def cohorts
    @current_cohorts = find_cohorts.map do |c|
      c.text
    end
  end

  def find_topics
    page.css('h3')
  end

  def cohorts_and_topics
     page.css('h2,h3')
  end

  def sort_topics_by_cohort
    topics_by_cohort = {}
    topics = []
    cohorts_and_topics.each do |top|
      topic = top.text
      if(cohorts.include?(topic))
        @current_key = topic
        topics = []
      else
        topics << topic
      end
      topics_by_cohort[@current_key] = topics 
    end
    topics_by_cohort
  end
end