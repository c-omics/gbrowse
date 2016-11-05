FROM comics/centos
MAINTAINER Ian Merrick <MerrickI@Cardiff.ac.uk>

##############################################################
# Dockerfile Version:   0.1
# Software:             gbrowse
# Software Version:     latest available in CPAN
# Software Website:     https://github.com/GMOD/GBrowse
# Description:          the Generic Genome Browser
##############################################################

RUN yum install -y httpd \
                   mod_fcgid \
                   fcgi-perl; \
    yum clean all
#    systemctl enable httpd.service

RUN yum install -y \
           bzip2 \
           expat \
           expat-devel \
           gcc \
           gd \
           gd-devel \
           git \
           gmp-devel \
           graphviz \
           graphviz-devel \
           httpd \
           libxml2 \
           libxml2-devel \
           make \
           mariadb-devel \
           ncurses-devel \
           openssl-devel \
           perl    \
           perl-App-cpanminus \
           perl-bioperl \
           perl-CPAN  \
           perl-GD \
           perl-Module-Build \
           perl-CPAN \
           perl-IO-String \
           perl-Capture-Tiny \
           perl-CGI-Session \
           perl-JSON \
           perl-JSON-Any \
           perl-libwww-perl \
           perl-DBD-SQLite \
           perl-File-NFSLock \
           perl-Net-SMTP-SSL \
           perl-Crypt-SSLeay \ 
           perl-Net-SSLeay \
           perl-Template-Toolkit \
           perl-local-lib \
           perl-Test-Most \
           unzip \
           wget \
           zlib-devel 
#           perl-Bio-Graphics 
RUN cpanm SVG \
          CGI \
          DBI \
          DBD::mysql \
          DBD::SQLite \
          Statistics::Descriptive \
          Data::Stag \
          GD::Graph \
          GD::Graph::smoothlines \
          GD::SVG \
          Statistics::Lite \
          Statistics::LineFit \
          Compress::Zlib \
          IO::Zlib \
          Config::Simple \
          Pod::Usage \
          Algorithm::Cluster \
          Env \
          DB_File \
          CGI::Session \
          Crypt::SSLeay \
          DB_File::Lock \
          FCGI \
          File::NFSLock \
          Net::OpenID::Consumer \
          Net::SMTP::SSL \
          Parse::Apache::ServerStatus \
          Template  \
          JSON \
          LWP \
          Module::Build \
          GD \
          Storable \
          IO::String \
          Capture::Tiny \
          File::Temp \
          Digest::MD5 \
          Statistics::Descriptive
RUN cd / ; \
    git clone https://github.com/bioperl/bioperl-live.git ; \
        cd bioperl-live ; \
        git checkout tags/bioperl-release-1-6-901 ; \
        yes '' | perl Build.PL ; \
       ./Build test ; \
       ./Build install 
RUN cd / ; \
    cpanm Bio::Graphics ; \
    git clone https://github.com/GMOD/GBrowse ; \
    cd GBrowse ; \
    git checkout tags/release-2_55 ; \
    perl Build.PL ; \
    yes '' | ./Build test ; \
    yes 'n' | ./Build install


# this method works, but problems with Bio::DB::Sam
#
#curl -o samtools-1.3.1.tar.bz2  -L https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2
#tar xvaf samtools-1.3.1.tar.bz2
#cd samtools-1.3.1
#./configure
#make all all-htslib
#make prefix=/software/applications/samtools/1.3.1_ install install-htslib

# old method of installing samtools...
#
#    curl -L -o htslib-1.3.1.tar.gz https://github.com/samtools/htslib/archive/1.3.1.tar.gz ; \
#    curl -L -o samtools-1.3.1.tar.gz https://github.com/samtools/samtools/archive/1.3.1.tar.gz ; \
#    curl -L -o bcftools-1.3.1.tar.gz https://github.com/samtools/bcftools/archive/1.3.1.tar.gz ; \
#    tar xzf bcftools-1.3.1.tar.gz ; \
#    tar xzf htslib-1.3.1.tar.gz ; \
#    tar xzf samtools-1.3.1.tar.gz ; \
#    rm -rf bcftools-1.3.1.tar.gz ; \
#    rm -rf htslib-1.3.1.tar.gz ; \
#    rm -rf samtools-1.3.1.tar.gz ; \
#    mv htslib-1.3.1 htslib ; \
#    cd bcftools-1.3.1 ; \
#    make -j HTSDIR=../htslib ; \
#    make prefix=/software/applications/bcftools/1.3.1 install ; \
#    mkdir -p /software/applications/samtools/1.3.1/src ; \
#    cp -a *.[ch] libbam.a /software/applications/samtools/1.3.1/src ; \
#    cd .. ; \
#    cd samtools-1.3.1 ; \
#    make -j HTSDIR=../htslib ; \
#    make prefix=/software/applications/samtools/1.3.1 install ; \
#    cd ../ ; \
#    rm -rf htslib samtools-1.3.1 bcftools-1.3.1

#RUN cd /tmp ; \
#    curl -o jksrc.zip -L http://hgdownload.cse.ucsc.edu/admin/jksrc.zip ; \
#    unzip jksrc.zip ; \
#    cd kent/src/lib ; \
#    export MACHTYPE=`uname -m` ; \
#    export CFLAGS="-fPIC"
#    make -j ; \
#    cp x86_64/jkweb.a . ; \
#    export KENT_SRC=/tmp/kent/src ; \
#    cpan install Bio::DB::BigFile ; \
#    cpan install DB_File::Lock ; \
#    cpan install Parse::Apache::ServerStatus ; \
#    cpan install Template ; \
#    cpan install Net::OpenID::Consumer ; \
   
#    cpan install Bio::DB::Sam ; \
#    git clone $GIT ; \
#    cd $APP_NAME ; \
#    git checkout tags/$VERSION ; \
#    perl Build.PL --install_base=$DEST/$$VERSION ; \
#    ./Build install ; \    ## interactive step. BUGGER!!
#    rm -rf ~/.cpan ; \ 
#    mkdir -p /usr/share/licenses/$APP_NAME-$VERSION ; \
#    cp LICENSE.txt /usr/share/licenses/$APP_NAME-$VERSION/ ; \
#    cd ../         ; \
#    mkdir -p $DEST ; \
#    mv $APP_NAME $DEST/$VERSION

COPY gbrowse_entrypoint.sh /usr/local/bin/gbrowse_entrypoint.sh
ENTRYPOINT ["/usr/local/bin/gbrowse_entrypoint.sh"]

