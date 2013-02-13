# coding: utf-8
require 'open-uri'
require 'nokogiri'

module KanazawaLoopBus
  class BusLocationService
    attr_reader :fetch_time

    def initialize
      fetch
    end

    def fetch
      @doc = Nokogiri::HTML(fetch_html)
      raise "Service Finished" if service_finished?
      @fetch_time = Time.now
    end
    alias_method :refetch!, :fetch

    def buses
      @doc.xpath('//td/img').select { |img|
        /\.\.\/img\/busicon\/car_s_.\.gif/ =~ img["src"]
      }.map { |img|
        Bus.from_node(img)
      }
    end

    private
    def fetch_html
      open('http://vbusloc.hokutetsu.co.jp/bus/?rno=1&lang=jp').read
                                                               .encode("UTF-8", "Shift_JIS",
                                                                       invalid: :replace, undef: :replace, replace: "")
    end

    def service_finished?
      @doc.css('//td/img').select { |img|
        /\.\.\/img\/busicon\/car_s_.\.gif/ =~ img["src"]
      }.empty?
    end
  end
end
