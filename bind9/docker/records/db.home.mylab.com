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
host2  IN  A   192.168.2.33
host3  IN  A   192.168.2.34
ocp-api IN  A   192.168.2.50
ocp-master1 IN  A   192.168.2.51
ocp-master2 IN  A   192.168.2.52
ocp-master3 IN  A   192.168.2.53
ocp-worker1 IN  A   192.168.2.54
ocp-worker2 IN  A   192.168.2.55
ocp-worker3 IN  A   192.168.2.56
ocp-ingress IN  A   192.168.2.59
