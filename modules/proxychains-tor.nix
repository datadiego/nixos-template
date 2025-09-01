{ config, pkgs, ... }:

{
  programs.proxychains = {
    enable = true;
    package = pkgs.proxychains;
    proxies = {
      tor = {
        type = "socks5";
        host = "127.0.0.1";
        port = 9050;
      };
    };
    strictChain = true;    # equivalente a strict_chain
    proxyDns = true;       # evita fugas DNS
  };
}
