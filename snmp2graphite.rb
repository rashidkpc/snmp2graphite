load '/opt/snmp2graphite/config.rb'

require 'rubygems'
require 'socket'
require 'snmp'

def run
  begin
    socket = TCPSocket.open(GRAPHITE_HOST,GRAPHITE_PORT)
    output = "" 
    METRICS.each do |host,oids|
      begin
        output += qh(host,oids)
      rescue Exception => e
        puts "SNMP connection failed to #{host} with community #{COMMUNITY}"
      end
    end
    socket.print(output)
    socket.close
  rescue
    puts "Graphite connection failed to #{GRAPHITE_HOST}:#{GRAPHITE_PORT}"
  end
end

def qh(host,oids)
  output = ""
  time = Time.now.to_i.to_s
  results = Array.new
  SNMP::Manager.open(:Host => host, :Version => :SNMPv1, :Community => COMMUNITY) do |manager|
    response = manager.get(oids.values)                                       
    response.each_varbind do |varbind|                                        
      results.push(varbind.value.to_s)                                        
    end                                                                       
  end                                                                         
  Hash[*oids.keys.zip(results).flatten].each do |k,v|                         
    output += "#{SENDER}.#{host.gsub(/\./,'_')}.#{k} #{v} #{time}\n"          
  end
  output
end 

loop {
  run()
  sleep INTERVAL;
}
