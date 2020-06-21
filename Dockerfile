FROM namr2000/seawolf8-dev
SHELL ["/bin/bash", "-c", "-l"]

ENV PATH $PATH:/ardupilot/Tools/autotest
ENV PATH /usr/lib/ccache:$PATH
WORKDIR /

RUN mkdir Seawolf-8-Software
ADD . Seawolf-8-Software/

WORKDIR /Seawolf-8-Software

RUN source /opt/ros/melodic/setup.bash; catkin_make clean; rm -rf build; catkin_make