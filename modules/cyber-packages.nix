{ pkgs }:

[
  pkgs.tor
  pkgs.proxychains

  #sniffing/spoofing
  pkgs.wireshark
  pkgs.tcpdump
  pkgs.mitm6
  pkgs.mitmproxy
  pkgs.arpoison
  pkgs.driftnet
  pkgs.sslstrip

  #vuln-analysis
  pkgs.nikto
  pkgs.openvas-scanner
  pkgs.wapiti
  pkgs.sqlmap

  #webapp
  pkgs.burpsuite
  pkgs.dirb
  pkgs.gobuster
  pkgs.whatweb
  pkgs.zap
  pkgs.wpscan

  #information-gathering
  pkgs.nmap
  pkgs.volatility3
  pkgs.recon-ng
  pkgs.theharvester
  pkgs.dig
  pkgs.mapcidr
  pkgs.httpx
  pkgs.dnsenum
  pkgs.fierce
  pkgs.whois
  pkgs.dmitry
  pkgs.netdiscover
  pkgs.dnsx
  pkgs.ipcalc

  #password-cracking
  pkgs.john
  pkgs.hashcat
  pkgs.hydra
  pkgs.medusa
  pkgs.crunch
  pkgs.wordlists
  
  #wireless
  pkgs.angryoxide
  pkgs.bettercap
  pkgs.kismet
  pkgs.reaverwps
  pkgs.wifite2

  #exploitation
  pkgs.metasploit
  pkgs.exploitdb
  pkgs.msfpc
  pkgs.routersploit

  #reversing
  pkgs.ghidra
  pkgs.radare2
  pkgs.binwalk
  pkgs.strace

]
