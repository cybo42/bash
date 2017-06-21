function dnsflush(){
  #OS X Yosemite +
  #Use the following Terminal command to reset the DNS cache:
  #OS X 10.10+ (Yosemite):
  sudo discoveryutil mdnsflushcache

  #OS X Mavericks, Mountain Lion, and Lion
  # OS X 10.7–10.9 (Lion, Mountain Lion, Mavericks):


  #Use the following Terminal command to reset the DNS cache:
  #sudo killall -HUP mDNSResponder

  #Mac OS X v10.6
  #OS X pre-10.7 (before Lion):
  #Use the following Terminal command to reset the DNS cache:
  #sudo dscacheutil -flushcache
}

