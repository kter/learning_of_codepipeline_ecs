FROM centos:7

# RUN yum install -y epel-release libmp4v2
# RUN rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
# RUN rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
# RUN yum install -y ffmpeg rtmpdump
# RUN yum groupinstall -y "Development Tools"
# RUN yum install -y libjpeg-devel giflib-devel freetype-devel
# WORKDIR /tmp
# RUN wget http://www.swftools.org/swftools-2013-04-09-1007.tar.gz
# RUN tar -zvxf swftools-2013-04-09-1007.tar.gz
# RUN cd swftools-2013-04-09-1007
# RUN ./configure --libdir=/usr/lib64 --bindir=/usr/bin
# RUN make && make install
# 
# WORKDIR /app
# 
# COPY https://github.com/TakeAsh/p-RecRadiru .

RUN yum install -y git perl-YAML perl-YAML-Syck perl-LWP-UserAgent perl-LWP-Protocol-https perl-XML-Simple perl-Time-Piece epel-release libmp4v2
RUN rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
RUN rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
RUN yum install -y ffmpeg libmp4v2

RUN git clone https://github.com/TakeAsh/p-RecRadiru
WORKDIR p-RecRadiru
CMD [./RecRadiru.pl,  tokyo, r1, 1]
