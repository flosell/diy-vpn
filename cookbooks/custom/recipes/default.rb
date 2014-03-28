file "/etc/openvpn/server.up.d/firewall_settings" do
  content "echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf
           sysctl -w net.ipv4.ip_forward=1
           iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE"
  owner "root"
  group "root"
  mode 00755
end