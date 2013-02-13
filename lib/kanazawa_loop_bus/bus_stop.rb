# coding: utf-8

module KanazawaLoopBus
  class BusStop
    NAMES = [
      "L0．金沢駅東口",
      "L1．リファーレ前",
      "L2．明成小学校前",
      "L3．小橋",
      "L4．馬場児童公園",
      "L5．森山１丁目",
      "L6．橋場町（交番前）",
      "L7．橋場町（金城楼前）",
      "L8．兼六元町",
      "L9．兼六園下（石川門向い）",
      "L10．広坂（石浦神社前）",
      "L11．本多町",
      "L12．犀星文学碑前",
      "L13．十三間町",
      "L14．片町（ラブロ前）",
      "L15．香林坊（日銀前）",
      "L16．香林坊（東横イン前）",
      "L17．南町",
      "L18．武蔵ヶ辻（めいてつエムザ前）",
      "L19．リファーレ前"
    ]

    class << self
      def from_name(name)
        id = NAMES.index(name) or raise "BusStop not found"
        BusStop.new(id)
      end
    end

    def initialize(id)
      @id = id
    end

    def name
      NAMES[@id]
    end

    def next
      BusStop.new((@id+1) % NAMES.size)
    end

    def prev
      BusStop.new((@id-1) % NAMES.size)
    end
  end
end
