#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class OfficeholderList < OfficeholderListBase
  decorator RemoveReferences
  decorator UnspanAllTables
  # decorator WikidataIdsDecorator::Links

  def header_column
    'Speaker'
  end

  class Officeholder < OfficeholderBase
    def columns
      %w[color number name dates].freeze
    end

    def raw_combo_date
      years = super.tidy
      years =~ /^\d{4}$/ ? "#{years} - #{years}" : years
    end

    def empty?
      too_early?
    end
  end
end

url = ARGV.first
puts EveryPoliticianScraper::ScraperData.new(url, klass: OfficeholderList).csv
