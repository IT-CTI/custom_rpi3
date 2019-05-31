################################################################################
#
# python-numpyf
#
################################################################################

PYTHON_NUMPYF_VERSION = 1.16.4
PYTHON_NUMPYF_SOURCE = numpy-$(PYTHON_NUMPYF_VERSION).tar.gz
PYTHON_NUMPYF_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPYF_VERSION)
PYTHON_NUMPYF_LICENSE = BSD-3-Clause
PYTHON_NUMPYF_LICENSE_FILES = LICENSE.txt
PYTHON_NUMPYF_SETUP_TYPE = setuptools

ifeq ($(BR2_PACKAGE_CLAPACK),y)
PYTHON_NUMPYF_DEPENDENCIES += clapack
PYTHON_NUMPYF_SITE_CFG_LIBS += blas lapack
else
PYTHON_NUMPYF_ENV += BLAS=None LAPACK=None
endif


define PYTHON_NUMPYF_CONFIGURE_CMDS
	-rm -f $(@D)/site.cfg
	echo "[DEFAULT]" >> $(@D)/site.cfg
	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
	echo "libraries =" $(subst $(space),$(comma),$(PYTHON_NUMPYF_SITE_CFG_LIBS)) >> $(@D)/site.cfg
endef

# Some package may include few headers from NumPy, so let's install it
# in the staging area.
PYTHON_NUMPYF_INSTALL_STAGING = YES

$(eval $(python-package))
$(eval $(host-python-package))
