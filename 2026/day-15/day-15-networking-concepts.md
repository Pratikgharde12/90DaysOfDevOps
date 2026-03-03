# Day 15 – Networking Concepts: DNS, IP, Subnets & Ports

## Challenge Tasks

### Task 1: DNS – How Names Become IPs
1. Explain in 3–4 lines: what happens when you type `google.com` in a browser? 
      
       Ans: The browser asks the DNS server to resolve the ip for google.com and then hits on the IP and gets and HTML page in response.
2. What are these record types? Write one line each:
       
       - `A`, `AAAA`, `CNAME`, `MX`, `NS`
       - A - Maps domain name to Ipv4 ip address.
       - AAAA - Maps domain name to Ipv6 ip address.
       - CNAME - Maps domain name with other alias.
       - MX Record - Specifies which mail server will hanlde emails for a domain.
       - NS Record - Name Server Record is a DNA which has stored details for a specific domain.

3. Run: `dig google.com` — identify the A record and TTL from the output
           
       ubuntu@ip-172-31-6-79:~$ dig google.com
        
        ; <<>> DiG 9.18.39-0ubuntu0.24.04.2-Ubuntu <<>> google.com
        ;; global options: +cmd
        ;; Got answer:
        ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 15426
        ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1
        
        ;; OPT PSEUDOSECTION:
        ; EDNS: version: 0, flags:; udp: 65494
        ;; QUESTION SECTION:
        ;google.com.                    IN      A
        
        ;; ANSWER SECTION:
        google.com.             208     IN      A       142.250.195.14
        
        ;; Query time: 0 msec
        ;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
        ;; WHEN: Tue Mar 03 07:02:41 UTC 2026
        ;; MSG SIZE  rcvd: 55


---

### Task 2: IP Addressing
1. What is an IPv4 address? How is it structured? (e.g., `192.168.1.10`)
    
        An IP address stands for internet protocol which help in identifing devices in a network, each device has a unique IP address in a newtwork.
        Ipv4 is in the form of 4 octates like 192.168.1.23 -- where each octate can have range from 0 to 255.
2. Difference between **public** and **private** IPs — give one example of each
    
        Public Ip address are the range of IPs which is assigned to public domains like google.com , youtube.com.
        Assigned by the ISP.
        Private IPs are assigned to personal devices in a network. These are assigned by the Router
3. What are the private IP ranges?
   
       - `10.x.x.x`, `172.16.x.x – 172.31.x.x`, `192.168.x.x`
       - Class A : 10.0.0.0 - 10.255.255.255
       - Class B : 172.16.0.0 - 172.31.255.255
       - Class C : 192.168.0.0 - 192.168.255.255
4. Run: `ip addr show` — identify which of your IPs are private

            1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
                link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
                inet 127.0.0.1/8 scope host lo
                   valid_lft forever preferred_lft forever
                inet6 ::1/128 scope host noprefixroute
                   valid_lft forever preferred_lft forever
            2: enX0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc fq_codel state UP group default qlen 1000
                link/ether 0a:22:77:76:8a:91 brd ff:ff:ff:ff:ff:ff
                inet 172.31.6.79/20 metric 100 brd 172.31.15.255 scope global dynamic enX0
                   valid_lft 3491sec preferred_lft 3491sec
                inet6 fe80::822:77ff:fe76:8a91/64 scope link
                   valid_lft forever preferred_lft forever
---

### Task 3: CIDR & Subnetting
1. What does `/24` mean in `192.168.1.0/24`?
   - /24 is the CIDR notation for the subnet mask. 
    it means that out of 32 , 24 bits are for network and 8 bits are for hosts.
    2 to the power 8 is 256 from this we subtract 2 reserved address and get 254 usable hosts.
2. How many usable hosts in a `/24`? A `/16`? A `/28`?
    -  2^8 = 256 -2 = 254
       2^16 = 65536 - 2 = 65534
       2^4 = 16 - 2 = 14
3. Explain in your own words: why do we subnet?
    - A subnet is the small sub-network inside a big network,This is done to improve security,network congestion, better IP management and control traffic flow.   
4. Quick exercise — fill in:

| CIDR | Subnet Mask     | Total IPs | Usable Hosts |
|------|-------------    |-----------|--------------|
| /24  | 255.255.255.0   | 256       | 254          |
| /16  | 255.255.0.0     | 65536     | 65534        |
| /28  | 255.255.255.240 | 16        | 14           |

---

### Task 4: Ports – The Doors to Services
1. What is a port? Why do we need them?
  -  A subnet is the small sub-network inside a big network,This is done to improve security,network congestion, better IP management and control traffic flow.   
2. Document these common ports:

| Port | Service |
|------|---------|
| 22   | SSH     |
| 80   | HTTP    |
| 443  | HTTPS   |
| 53   | DNS     |
| 3306 | MYSQL   |
| 6379 | REDIS   |
| 27017| MONGO   |

3. Run `ss -tulpn` — match at least 2 listening ports to their services

          ubuntu@ip-172-31-6-79:~$ ss -tulpn
          Netid State  Recv-Q  Send-Q      Local Address:Port   Peer Address:Port Process
          HTTP PORT
          tcp   LISTEN 0       511                  [::]:80             [::]:*
          SSH PORT
          tcp   LISTEN 0       4096                 [::]:22             [::]:*

---

### Task 5: Putting It Together
Answer in 2–3 lines each:
- You run `curl http://myapp.com:8080` — what networking concepts from today are involved?
   - DNS , IP Address and Ports.
- Your app can't reach a database at `10.0.1.50:3306` — what would you check first?
   - First ping the database for the your host, then check the on the database if it is up and exposed on 3306 port.
---

- What you learned (3 key points)
   - How DNS works what is DNS server.
   - What are IP address and their classes.
   - subnet masks and subnetting. 
   
---
