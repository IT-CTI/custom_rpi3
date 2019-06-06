################################################################################
#
# python-scipy
#
################################################################################

PYTHON_SCIPY_VERSION = 1.3.0-rpi
PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
PYTHON_SCIPY_SITE = https://github.com/IT-CTI/scipy/releases/download/v$(PYTHON_SCIPY_VERSION)
PYTHON_SCIPY_LICENSE = BSD-3-Clause, BSD-2-Clause, PSF, Apache-2.0, MIT, Zlib
PYTHON_SCIPY_LICENSE_FILES = LICENSE.txt
PYTHON_SCIPY_SETUP_TYPE = setuptools
# PYTHON_SCIPY_ENV =  BLAS=None LAPACK=None ATLAS=None LD_PRELOAD="/home/johnbat26/kingston/projects/IoT/custom_rpi3/.nerves/artifacts/custom_rpi3-portable-1.7.2/host/lib/libgfortran.so.4" 
#PYTHON_SCIPY_ENV = LD_PRELOAD="/home/johnbat26/kingston/projects/IoT/custom_rpi3/.nerves/artifacts/custom_rpi3-portable-1.7.2/host/lib/libgfortran.so.4" 
# PYTHON_SCIPY_BUILD_OPTS = --fcompiler=None
PYTHON_SCIPY_DEPENDENCIES = host-python-numpy

ifeq ($(BR2_PACKAGE_CLAPACK),y)
PYTHON_SCIPY_DEPENDENCIES += clapack
PYTHON_SCIPY_SITE_CFG_LIBS += blas lapack
else
PYTHON_SCIPY_ENV += BLAS=None LAPACK=None
endif

PYTHON_SCIPY_BUILD_OPTS = --fcompiler=None

define PYTHON_SCIPY_CONFIGURE_CMDS
	-rm -f $(@D)/site.cfg
	echo "[DEFAULT]" >> $(@D)/site.cfg
	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
	echo "libraries =" $(subst $(space),$(comma),$(PYTHON_SCIPY_SITE_CFG_LIBS)) >> $(@D)/site.cfg
endef

$(eval $(python-package))
$(eval $(host-python-package))
