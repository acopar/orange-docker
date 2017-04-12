FROM consol/centos-xfce-vnc

USER root

# conda install requires bzip
RUN yum -y install python3-pip python3-dev python-virtualenv bzip2

ENV USER orange
ENV PASSWORD orange
ENV HOME /home/${USER}
ENV CONDA_DIR /home/${USER}/.conda

RUN useradd -m -s /bin/bash ${USER}
RUN echo "${USER}:${PASSWORD}" | chpasswd
RUN gpasswd -a ${USER} wheel

USER orange
WORKDIR ${HOME}

RUN wget -q https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh -O anaconda.sh
RUN bash anaconda.sh -b -p ~/.conda && rm anaconda.sh
RUN $CONDA_DIR/bin/conda create python=3.5 --name orange3
RUN $CONDA_DIR/bin/conda config --add channels conda-forge
RUN bash -c "source $CONDA_DIR/bin/activate orange3 && \
    $CONDA_DIR/bin/conda install orange3 && $CONDA_DIR/bin/conda install -c defaults pyqt qt"
RUN echo 'export PATH=~/.conda/bin:$PATH' >> /home/orange/.bashrc

COPY icons/orange.png /usr/share/backgrounds/images/orange.png
COPY icons/orange.png .conda/share/orange3/orange.png
COPY orange/orange-canvas.desktop Desktop/orange-canvas.desktop
COPY config/xfce4 .config/xfce4

# COPY does not obey USER directive
USER root
RUN chown -R orange:orange .config Desktop
USER orange

# Prepare for external settings volume
RUN mkdir .config/biolab.si

ENV VNC_RESOLUTION 1920x1080
ENV VNC_PW orange

RUN cp /headless/wm_startup.sh ${HOME}


ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--tail-log"]
