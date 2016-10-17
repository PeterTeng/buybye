require 'kirchhoff'
require 'maxwell'
require 'pry'

class ScrapeCollegeData
  def self.exec
    driver = Kirchhoff::Driver.new
    driver.go('https://mrcolle.com/tus2016/vote')
    driver.find('a[message="エントリーナンバー5の千葉聖哉さんに投票しますか？"]').click
    binding.pry
    driver.find('button[class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"]')
    binding.pry
  end
end
