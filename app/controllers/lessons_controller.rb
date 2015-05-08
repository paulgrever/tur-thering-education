require 'open-uri'
class LessonsController < ApplicationController
  def index
    @cohorts = TuringScraper.new
  end
end
