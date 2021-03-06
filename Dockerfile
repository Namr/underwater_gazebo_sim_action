FROM namr2000/seawolf8-dev
SHELL ["/bin/bash", "-c", "-l"]

ENV PATH $PATH:/ardupilot/Tools/autotest
ENV PATH /usr/lib/ccache:$PATH
WORKDIR /

RUN git clone https://github.com/ncsurobotics/Seawolf-8-Software.git
WORKDIR /Seawolf-8-Software
RUN git checkout pose-control

RUN source /opt/ros/melodic/setup.bash; catkin_make clean; rm -rf build; catkin_make

ENTRYPOINT ["unbuffer", "/Seawolf-8-Software/test_start.sh"]