#
# This is a comment header
#

# Multi-value A
+example.com:10.2.3.4:30
+example.com.:10.2.3.5:30

Ccname.other.foo:www.other.foo

# A+PTR
=some-host-abc123.example.com.:10.2.3.7:1800
# A+PTR with duplicate address, fine for A's, but warning on PTRs
=has-dup-def123.example.com:10.2.3.8
=has-dup-def456.example.com:10.2.3.8

# A+PTR with an ip addr we ignore
=ignored.example.com:0.0.0.0

# PTR
^10.3.2.10.in-addr.arpa:a-ptr.example.com
^11.3.2.10.in-addr.arpa:a-ptr-2.example.com:30

# PTR in another zone we won't be interested in
^142.1.168.192.in-addr.arpa:a-ptr.example.com

# MX
@example.com::smtp-1-host.example.com:10
@example.com.::smtp-2-host.example.com:20
# MX with ttl and ip
@smtp.example.com:21.22.23.24:smtp-3-host:30:1800
@smtp.example.com.:22.23.24.25:smtp-4-host:40:1800

# NS for sub
.sub.example.com::ns3.ns.com:30
.sub.example.com.::ns4.ns.com:30
# NS with ip
.other.example.com:14.15.16.17:ns5:30
.other.example.com.:15.16.17.18:ns6:30

# A, under sub
+www.sub.example.com:1.2.3.4

# Top-level NS
.example.com::ns1.ns.com
.example.com.::ns2.ns.com
# Top-level NS with automatic A
&example.com:42.43.44.45:a
&example.com.:43.44.45.46:b:31

# sub special cases
+a1.blah-asdf.subtest.com:10.2.3.5
+a2.blah-asdf.subtest.com:10.2.3.6
+a3.asdf.subtest.com:10.2.3.7

'example.com:test TXT:300
'colon.example.com:test \072 TXT:300
'nottl.example.com:nottl test TXT

3ipv6-3.example.com:2a021348017cd5d0002419fffef35742:300
6ipv6-6.example.com:2a021348017cd5d0002419fffef35743

'semicolon.example.com:v=DKIM1; k=rsa; p=blah:300
