#.rst:
# BuildYARP
# ---------
#
# YARP

#=============================================================================
# Copyright 2013-2014 iCub Facility, Istituto Italiano di Tecnologia
#   Authors: Daniele E. Domenichelli <daniele.domenichelli@iit.it>
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of YCM, substitute the full
#  License text for the above reference.)

include(YCMEPHelper)
include(FindOrBuildPackage)

find_or_build_package(TinyXML QUIET)
if(COMMAND set_package_properties)
    set_package_properties(TinyXML PROPERTIES PURPOSE "Used by YARP")
endif()

if(CODYCO_USES_PYTHON OR CODYCO_USES_OCTAVE)
    set(YARP_COMPILE_BINDINGS ON)
else()
    set(YARP_COMPILE_BINDINGS OFF)
endif()


ycm_ep_helper(YARP TYPE GIT
                   STYLE GITHUB
                   REPOSITORY robotology/yarp.git
                   TAG master
                   COMPONENT libraries
                   DEPENDS TinyXML
                   CMAKE_CACHE_ARGS -DCREATE_IDLS:BOOL=ON
                                    -DCREATE_GUIS:BOOL=ON
                                    -DCREATE_SHARED_LIBRARY:BOOL=ON
                                    -DYARP_USE_SYSTEM_SQLITE:BOOL=ON
                                    -DCREATE_LIB_MATH:BOOL=ON
                                    -DYARP_USE_ATLAS:BOOL=OFF
                                    -DDOX_GENERATE_XML:BOOL=OFF
                                    -DCREATE_OPTIONAL_CARRIERS:BOOL=ON
                                    -DENABLE_yarpcar_bayer:BOOL=ON
                                    -DENABLE_yarpcar_tcpros:BOOL=ON
                                    -DENABLE_yarpcar_xmlrpc:BOOL=ON
                                    -DENABLE_yarpcar_priority:BOOL=ON
                                    -DENABLE_yarpcar_bayer:BOOL=ON
                                    -DENABLE_yarpidl_thrift:BOOL=ON
                                    -DCREATE_DEVICE_LIBRARY_MODULES:BOOL=ON
                                    -DENABLE_yarpcar_human:BOOL=ON
                                    -DENABLE_yarpcar_mjpeg:BOOL=OFF
                                    -DENABLE_yarpcar_rossrv:BOOL=ON
                                    -DENABLE_yarpmod_fakebot:BOOL=ON
                                    -DENABLE_yarpmod_opencv_grabber:BOOL=OFF
                                    -DYARP_COMPILE_TESTS:BOOL=OFF
                                    -DYARP_COMPILE_EXPERIMENTAL_WRAPPERS:BOOL=ON
                                    -DYARP_DOXYGEN_XML:BOOL=OFF
                                    -DYARP_DOXYGEN_TAGFILE:BOOL=OFF
                                    -DYARP_COMPILE_BINDINGS:BOOL=${YARP_COMPILE_BINDINGS}
                                    -DCREATE_PYTHON:BOOL=${CODYCO_USES_PYTHON}
                                    -DCREATE_OCTAVE:BOOL=OFF)
