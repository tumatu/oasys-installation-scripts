#!/bin/bash

#===============================================================================
#
# script to install OASYS add-ons from github sources  
#
#===============================================================================
#
#

# proxy 
# export https_proxy=http://proxy.esrf.fr:3128/
# export http_proxy=http://proxy.esrf.fr:3128/

# clean old stuff
echo "Cleaning old installation files..."
rm -rf shadowOui xoppy crystal wise xrayserver

# define python
source oasys1env/bin/activate

# shadowOui
echo "Installing Oasys add-on shadowOui"
git clone https://github.com/lucarebuffi/shadowOui
cd shadowOui
python setup.py develop
cd ..

# xoppy
echo "Installing Oasys add-on xoppy"
git clone https://github.com/srio/Orange-XOPPY xoppy
cd xoppy
python setup.py develop
cd ..

# crystal
echo "Installing Oasys add-on crystal"
git clone https://github.com/mark-glass/Orange-Crystal crystal
cd crystal
python setup.py develop
cd ..

# wise
echo "Installing Oasys add-on wise"
git clone https://github.com/lucarebuffi/WISE.git wise
cd wise
python setup.py develop
cd ..

# xrayserver
echo "Installing Oasys add-on xrayserver"
git clone https://github.com/lucarebuffi/XRayServer xrayserver
cd xrayserver
python setup.py develop
cd ..

echo "All done. You can start Oasys with new add-ons using ./start_oasys.sh"
