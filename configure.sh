set -e
cd /tmp

# Download apr and apr-util sources and extract them.
curl -L -O https://dlcdn.apache.org//apr/apr-1.7.4.tar.gz
curl -L -O https://dlcdn.apache.org//apr/apr-util-1.6.3.tar.gz

tar -xzvf apr-1.7.4.tar.gz
tar -xzvf apr-util-1.6.3.tar.gz

# Install apr
cd apr-1.7.4
./configure
make
sudo make install
cd ..

# Install apr-util
cd apr-util-1.6.3
./configure --with-apr=/usr/local/apr
make
sudo make install
cd ..

# Clean and exit
rm -rf apr-1.7.4* apr-util-1.6.3*

curl -L https://github.com/websnarf/bstrlib/archive/master.zip -o bstrlib-master.zip

unzip bstrlib-master.zip





