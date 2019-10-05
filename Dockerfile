FROM ubuntu

ENV LC_ALL="C"
ENV LD_LIBRARY_PATH="/usr/local/lib"

RUN apt-get update && apt-get install -y liblist-moreutils-perl git autoconf build-essential g++ python-dev autotools-dev libicu-dev build-essential libbz2-dev libboost-all-dev wget

RUN wget https://sourceforge.net/projects/boost/files/boost/1.62.0/boost_1_62_0.tar.gz -O - | tar xzf - && cd boost_1_62_0 && ./bootstrap.sh --prefix=/usr/local && ./b2 install

RUN git clone https://github.com/DiltheyLab/MetaMaps.git && cd MetaMaps && ./bootstrap.sh && ./configure --with-boost=/usr/local && make metamaps && cp metamaps /usr/bin/

CMD ["metamaps"]
