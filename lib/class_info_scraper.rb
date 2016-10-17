require 'maxwell'

class ClassInfoScraper < Maxwell::Base
  attr_accessor :name, :professor_name, :department, :periods, :weekday, :semester

  javascript true

  def parser html
    @name           = html.css("c-vh-title td")
    # @professor_name = html.at("img._8gpiy._r43r5")[:src]
    # @department
    # @periods
    # @weekda
    # @semester
  end
end
