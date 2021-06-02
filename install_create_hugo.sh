touch /etc/yum.repos.d/hugo.repo

hn=`ip addr | awk '/^[0-9]+: / {}; /inet.*global.*eth/ {print gensub(/(.*)\/(.*)/, "\\1", "g", $2)}'`

#create repo
cat > /etc/yum.repos.d/hugo.repo <<EOF
[daftaupe-hugo]
name=Copr repo for hugo owned by daftaupe
baseurl=https://copr-be.cloud.fedoraproject.org/results/daftaupe/hugo/epel-7-$basearch/
type=rpm-md
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/daftaupe/hugo/pubkey.gpg
repo_gpgcheck=0
enabled=1
EOF


# install  golang  hugo
yum install -y  golang  hugo
if [ -d /data ] ; then echo "data exist" ; else  mkdir /data; fi

# create hugo default page, in this request ,we dont need to download screen.
cd /data && hugo new site fortune

# start hugo 
hugo server  -D --bind ${hn} -p 2314 --baseURL=http://${hn}:2314
