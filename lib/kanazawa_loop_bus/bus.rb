# coding: utf-8

module KanazawaLoopBus
  class Bus
    attr_reader :previous_stop, :next_stop

    NAMES = [
      "鏡花号",
      "鏡花号",
      "秋声号",
      "犀星号"
    ]

    class << self
      def from_node(node)
        node = node.parent.parent
        id = /\.\.\/img\/busicon\/car_s_(\d)\.gif/.match(node["src"]).to_a[1].to_i or raise "Bus not found"
        Bus.new({
          id: id-1,
          previous_stop_name: node.previous.css('font').inner_text,
          next_stop_name: node.next.css('font').inner_text
        })
      end
    end

    def initialize(option)
      @id = option[:id] 
      @previous_stop = BusStop.from_name(option[:previous_stop_name])
      @next_stop = BusStop.from_name(option[:next_stop_name])
    end

    def name
      NAMES[@id]
    end
  end
end
