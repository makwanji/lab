$TTL 604800
@   IN  SOA home.mylab.com. admin.home.mylab.com. (
        1         ; Serial
        604800    ; Refresh
        86400     ; Retry
        2419200   ; Expire
        604800 )  ; Negative Cache TTL
;
@   IN  NS  ns.home.mylab.com.
ns  IN  A   192.168.2.2
host0  IN  A   192.168.2.31
host1  IN  A   192.168.2.32
host3  IN  A   192.168.2.33
host4  IN  A   192.168.2.34