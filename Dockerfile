FROM vbatts/slackware:14.2
#    echo "https://mirrors.slackware.com/slackware/slackware64-14.2/" > /etc/slackpkg/mirrors &&\
#    sed -i 's|\(WGETFLAGS=\).*|\1\"--passive-ftp --no-check-certificate\"|' /etc/slackpkg/slackpkg.conf &&\
#    echo "http://sunsite.icm.edu.pl/packages/linux-slackware/slackware64-14.2/" > /etc/slackpkg/mirrors &&\
#    echo "http://ftp.slackware.pl/pub/slackware/slackware64-14.2/" > /etc/slackpkg/mirrors &&\

RUN mv /etc/slackpkg/mirrors /etc/slackpkg/mirrors.org &&\
    echo "http://sunsite.icm.edu.pl/packages/linux-slackware/slackware64-14.2/" > /etc/slackpkg/mirrors &&\
    slackpkg -batch=on -default_answer=y update &&\
    slackpkg -batch=on -default_answer=y upgrade-all
#RUN slackpkg -batch=on -default_answer=y upgrade patches    
RUN slackpkg -batch=on -default_answer=y install \
            bash-completion \
#            perl python vim \
#            rpcbind libtirpc nfs-utils
            gamin cyrus-sasl gnutls p11-kit nettle libffi \
            samba \
            dbus cups cups-filters
RUN cp /etc/samba/smb.conf-sample /etc/samba/smb.conf
EXPOSE 631