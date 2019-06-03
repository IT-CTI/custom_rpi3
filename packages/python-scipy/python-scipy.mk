################################################################################
#
# python-scipy
#
################################################################################

PYTHON_SCIPY_VERSION = 1.3.0
PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
PYTHON_SCIPY_SITE = https://github.com/scipy/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
PYTHON_SCIPY_LICENSE = BSD-3-Clause, BSD-2-Clause, PSF, Apache-2.0, MIT, Zlib
PYTHON_SCIPY_LICENSE_FILES = LICENSE.txt
PYTHON_SCIPY_SETUP_TYPE = setuptools
PYTHON_SCIPY_ENV= LD_PRELOAD="/home/johnbat26/kingston/projects/IoT/custom_rpi3/.nerves/artifacts/custom_rpi3-portable-1.7.2/host/lib/libgfortran.so.4" 
PYTHON_SCIPY_BUILD_OPTS= --fcompiler=gnu95
PYTHON_SCIPY_DEPENDENCIES = host-python-numpy

$(eval $(python-package))
$(eval $(host-python-package))