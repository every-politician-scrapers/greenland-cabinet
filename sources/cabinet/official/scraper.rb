#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    field :name do
      noko.css('strong').map(&:text).map(&:tidy).first
    end

    field :position do
      noko.css('.text p').first.text.tidy
    end

    def empty?
      name.to_s.tidy.empty?
    end
  end

  class Members
    def member_items
      super.reject(&:empty?)
    end

    def member_container
      noko.css('.third-section .small-12')
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
