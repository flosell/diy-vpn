DIR=$(mktemp -d -t vpn)

if [ $# -eq 0 ]; then 
  vagrant ssh-config > $DIR/vagrant.ssh.config
  SSH_OPTS="-F vagrant.ssh.config"
  SSH_USER_HOST="default"

  VPN_NAME="default-vpn"
elif [ $# -ne 3 ] || [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
  echo "Usage: $0 <user> <host> <vpn-name>"
  exit 1
else 
  SSH_OPTS=""
  SSH_USER="$1"
  SSH_HOST="$2"

  SSH_USER_HOST="${SSH_USER}@${SSH_HOST}"

  VPN_NAME="$3"
fi
echo $DIR
cd $DIR
scp -q $SSH_OPTS -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null  "${SSH_USER_HOST}:/etc/openvpn/keys/florian.tar.gz" .
tar xfz florian.tar.gz
mv florian.ovpn ${VPN_NAME}.ovpn

if [ "$SSH_HOST" != "" ]; then
  # set given host as remote for vpn
  sed -i -e "s/remote [^ ]*/remote ${SSH_HOST}/g" vpn-us.ovpn
fi

open ${VPN_NAME}.ovpn

echo "====== Pulled current VPN configuration. Please follow the tunnelblick instructions and then hit ENTER in this terminal to finish and clean up ======"
read
cd
rm -rf $DIR