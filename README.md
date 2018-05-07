# oasys-installation-scripts

Please read the instructions to install Oasys at this wiki: 
https://github.com/srio/oasys-installation-scripts/wiki

Some scripts and docs that may help in installing Oasys:

prepare_installation.sh : installs some packages requing "sudo" for linux (debian+ubuntu) 

install_oasys_using_miniconda.sh : Installs Oasys in $HOME/Oasys_Application with its own Python & packages (linux)

install_oasys_using_virtual_environment.sh : Installs Oasys in a Unix virtual environment

start_oasys.sh      : starts Oasys using the virtual environment installation

Oasys info at: https://www.elettra.trieste.it/oasys.html

## Installation Instruction added by Hongjie, May 2018

step1:
run ./Release 1.0/prepare_installation.sh

step2:
run ./Release 1.0/install_oasys1.sh

step3:
run ./start_oasys.sh

if you want to use SRW(under development), please install SRW first (https://github.com/ochubar/SRW) and install the library file by copying them to python-site-packages folder as scripts in ./Developers/install_srw_from_github.sh
      cp env/work/srw_python/srwlpy*.so $PYTHON_SITE_PACKAGES
      cp env/work/srw_python/uti*.py $PYTHON_SITE_PACKAGES
      cp env/work/srw_python/srwl_uti*.py $PYTHON_SITE_PACKAGES
      cp env/work/srw_python/srwlib.py $PYTHON_SITE_PACKAGES
      
after oasys started, check that every widgets are available to pop up; you can check console at the same time.

Normarlly, if OASYS1 can not load the specific widget, the reason is the import error which is also indicated in console

e.g., for my situation:

a)
Error: No module named 'PyQt5.QtWebKitWidgets'

Solution: Qt methods changing between versions, if conda automatically install the newest version (5.9.2) you may need to downgrade it to 5.6.0 version
conda install pyqt=5.6.0
conda will automatically downgrade other related packages also

b)
Error: from syned.beamline.shape import BoundaryShape, Rectangle, Circle, Ellipse; ImportError: cannot import name 'Circle'
at this point(5.5.2018), syned on pip repository is not compatible with other package, pls install the version(Circle added version) on github manually

Solution: pip uninstall syned  & cd ..
cd ~/Downloads & git clone https://github.com/oasys-kit/syned & cd ./syned & pip install -e . --no-deps --no-binary :all: & cd ..

c)
Error: ImportError: numpy.core.multiarray failed to import

Solution: 
reinstall numpy or upgrade numpy
conda uninstall numpy
conda install -U numpy

d)
Error: import error, can not find srwlib

Solution: install SRW manually and copy the srw lib file into python site-package folder

e)
Error: oasys crashes with error when doing shadow work "Internal Error: get_unit(): Bad internal unit KIND"

Solution:reinstall shadow3
python3 -m pip uninstall shadow3
python3 -m pip install shadow3 http://ftp.esrf.eu/pub/scisoft/shadow3/wheels/shadow3-18.4.11-cp36-cp36m-linux_x86_64.whl
pls see the issue:https://github.com/oasys-kit/ShadowOui/issues/187

f)
Error: ImportError: /home/hongjie/miniconda3/lib/python3.6/site-packages/PyQt5/../../../libstdc++.so.6: version 'CXXABI_1.3.9' not found

Solution: whereis libstdc++.so.6
cp /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /home/username/miniconda3/lib/
