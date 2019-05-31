################################################################################
#
# python-matplotlib
#
################################################################################

PYTHON_MATPLOTLIB_VERSION = 3.1.0
PYTHON_MATPLOTLIB_SOURCE = v$(PYTHON_MATPLOTLIB_VERSION).tar.gz
PYTHON_MATPLOTLIB_SITE = https://github.com/matplotlib/matplotlib/archive/
PYTHON_MATPLOTLIB_LICENSE = BSD-3-Clause, BSD-2-Clause, PSF, Apache-2.0, MIT, Zlib
PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE.txt
PYTHON_MATPLOTLIB_SETUP_TYPE = setuptools
PYTHON_MATPLOTLIB_DEPENDENCIES += python-numpyf
# PYTHON_MATPLOTLIB_INSTALL_STAGING = YES
# PYTHON_MATPLOTLIB_BUILD_OPTS = --fcompiler=None
#PYTHON_MATPLOTLIB_ENV = BLAS=None LAPACK=None ATLAS=None

$(eval $(python-package))
$(eval $(host-python-package))

