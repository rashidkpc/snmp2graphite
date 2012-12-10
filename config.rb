# How often to poll and relay to graphite
INTERVAL  = 30

# SNMP community                                                                
COMMUNITY = 'public'

# Graphite host and port
GRAPHITE_HOST = 'localhost' 
GRAPHITE_PORT = 2003

# This will be prepended to any metrics
SENDER    = 'snmp'

# hosts and metrics to collect
#
# METRICS   = {
#   "hostname.or.ip" => {
#     "graphite.key.here"  => 'example.snmp.oid.1.2.3'
#   }
# }
#
METRICS   = { 
  "127.0.0.1" => {
    "udp.in"    => 'udpInDatagrams.0',
    "udp.out"   => 'udpOutDatagrams.0'
  },
  "127.0.0.2" => {                                                              
    "tcp.established"    => 'tcpCurrEstab.0'                         
  }
}
