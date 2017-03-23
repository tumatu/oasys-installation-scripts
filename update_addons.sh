#!/bin/bash

#===============================================================================
#
# script to install OASYS add-ons from github sources  
#
#===============================================================================
#
#

# proxy 
# export all_proxy=http://proxy.esrf.fr:3128/


# define python
source oasys1env/bin/activate

# shadowOui
echo "Installing Oasys add-on shadowOui"
rm -rf shadowOui 
git clone https://github.com/lucarebuffi/shadowOui
cd shadowOui
python setup.py sdist develop
cd ..

# # wise
# echo "Installing Oasys add-on wise"
# rm -rf wise 
# git clone https://github.com/lucarebuffi/WISE.git wise
# cd wise
# python setup.py sdist develop
# cd ..

# # xrayserver
# echo "Installing Oasys add-on xrayserver"
# rm -rf xrayserver 
# git clone https://github.com/lucarebuffi/XRayServer xrayserver
# cd xrayserver
# python setup.py sdist develop
# cd ..

# # pySRU (needed in xoppy)
# echo "Installing pySRU"
# rm -rf pySRU 
# git clone https://github.com/srio/und_sophie_2016 pySRU
# cd pySRU
# python setup.py sdist develop
# cd ..

# # xoppy
# echo "Installing Oasys add-on xoppy"
# rm -rf xoppy 
# git clone https://github.com/srio/Orange-XOPPY xoppy
# cd xoppy
# python setup.py sdist develop
# cd ..

#
# THESE ARE EXPERIMENTAL - INSTALL AT YOUR OWN RISK........
#

# # oasys-addon-template
# echo "Installing Oasys add-on oasys-addon-template"
# rm -rf oasys-addon-template 
# git clone https://github.com/srio/oasys-addon-template
# cd oasys-addon-template
# python setup.py develop
# cd ..

# # oasys-dynXRD
# echo "Installing Oasys add-on oasys-dynXRD"
# rm -rf dynXRD
# git clone https://github.com/suracefm/dynXRD
# cd dynXRD
# git checkout oasys
# python setup.py develop
# cd ..
# rm -rf oasysdynXRD
# git clone https://github.com/suracefm/oasys-dynXRD oasysdynXRD
# cd oasysdynXRD
# python setup.py develop
# cd ..

# # oasys-crystalpy
# echo "Installing Oasys add-on oasys-crystalpy"
# rm -rf crystalpy
# git clone https://github.com/edocappelli/crystalpy
# cd crystalpy
# python setup.py develop
# cd ..
# rm -rf oasyscrystalpy
# git clone https://github.com/edocappelli/oasys-crystalpy oasyscrystalpy
# cd oasyscrystalpy
# python setup.py develop
# cd ..



echo "All done. You can start Oasys with new add-ons using ./start_oasys.sh"
