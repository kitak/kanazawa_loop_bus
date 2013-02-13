require "kanazawa_loop_bus/version"
require "kanazawa_loop_bus/bus_stop"
require "kanazawa_loop_bus/bus"
require "kanazawa_loop_bus/bus_location_service"

module KanazawaLoopBus
end

if __FILE__ == $0
  service = KanazawaLoopBus::BusLocationService.new
  puts service.fetch_time
  puts service.buses[0].name
  puts service.buses[0].next_stop.name
end
