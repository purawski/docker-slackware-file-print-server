FROM vbatts/slackware:14.2

#RUN echo "https://mirrors.slackware.com/slackware/slackware64-14.2/" > /etc/slackpkg/mirrors &&\
#    sed -i 's|\(WGETFLAGS=\).*|\1\"--passive-ftp --no-check-certificate\"|' /etc/slackpkg/slackpkg.conf 
RUN mv /etc/slackpkg/mirrors /etc/slackpkg/mirrors.org &&\
    echo "http://sunsite.icm.edu.pl/packages/linux-slackware/slackware64-14.2/" > /etc/slackpkg/mirrors &&\
    slackpkg -batch=on -default_answer=y update &&\
    slackpkg -batch=on -default_answer=y upgrade-all
#RUN slackpkg -batch=on -default_answer=y upgrade patches    
RUN slackpkg -batch=on -default_answer=y install \
            bash-completion \
            gnutls \
            dbus \
            p11-kit \
            nettle \
            libffi \
            cups \
            cups-filters
EXPOSE 631