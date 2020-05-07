FROM postgres:12-alpine
RUN apk add --update git make openssl-dev clang llvm9 g++
WORKDIR /tmp
RUN git clone git://git.postgresql.org/git/pldebugger.git
WORKDIR /tmp/pldebugger
ENV USE_PGXS=1
RUN make
RUN make install
COPY debugger-setup.sh /docker-entrypoint-initdb.d/
