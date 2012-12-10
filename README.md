Snmp2Graphite
=============

Snmp2Graphite is a very (~45 lines) simple ruby daemon for shipping snmp 
metrics to graphite  

Requirements:  
------------
ruby >= 1.8.7 (probably?)  
bundler  

Installation: 
-------------
### Install:  
git clone https://github.com/rashidkpc/snmp2graphite.git /opt/snmp2graphite  
cd /opt/snmp2graphite  
bundle install  

### Configure:  
Set the location of your config.rb in on the first  
line of /opt/snmp2graphite/snmp2graphite.rb:  
load '/opt/snmp2graphite/config.rb'  

#### Set your Graphite server and port in config.rb:  
GRAPHITE_HOST = 'graphite.example.com'  
GRAPHITE_PORT = 2003  

#### Add some things to monitor and ship:  
    METRICS   = {  
      "hostname.or.ip" => {  
        "graphite.key.here"  => 'example.snmp.oid.1.2.3'  
      }  
    }  

### Run:  
This will invoke snmp2graphite.rb and put it into the background.  
ruby /opt/snmp2graphite/daemon.rb start
