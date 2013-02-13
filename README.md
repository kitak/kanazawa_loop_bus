# KanazawaLoopBus

石川県金沢市の金沢周遊バスの位置を取得できます.  
データは次のサイトから取得しています． http://vbusloc.hokutetsu.co.jp/bus/?rno=1&lang=jp  
サイトの構造が変化するとデータが取得できなくなるので注意してください．

## Installation

Add this line to your application's Gemfile:

    gem 'kanazawa_loop_bus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kanazawa_loop_bus

## Usage

```ruby
service = KanazawaLoopBus::BusLocationService.new

service.fetch_time # データを取得した時間
service.buses[0].name # バスの名前（鏡花号，秋声号，犀星号）．

# バスのおおよその位置を取得
service.buses[0].prev_stop.name # 前のバス停の名前
service.buses[0].next_stop.name # 次のバス停の名前

service.buses[0].next_stop.next.name # 次のバス停のさらに次のバス停の名前

# データの再取得
service.refetch!
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
