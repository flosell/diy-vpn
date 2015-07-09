DIR=$(mktemp -d -t vpn)
vagrant ssh-config > $DIR/vagrant.ssh.config
cd $DIR
scp -q -F vagrant.ssh.config -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null  "default:/etc/openvpn/keys/florian.tar.gz" .
tar xfz florian.tar.gz
open florian.ovpn
echo "====== Pulled current VPN configuration. Please follow the tunnelblick instructions and then hit ENTER in this terminal to finish and clean up ======"
read
cd
rm -rf $DIR