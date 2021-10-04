#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    field :name do
      noko.xpath('.//strong/following-sibling::text()').text.split('(').first.tidy
    end

    field :position do
      noko.css('strong').first.text.tidy
    end
  end

  class Members
    def member_container
      noko.xpath('//span[@itemprop="articleBody"]//table//tr[td[strong]]')
    end
  end
end

file = Pathname.new 'html/official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
