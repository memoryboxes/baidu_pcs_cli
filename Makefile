PREFIX?=/usr/local
INSTALL_BIN= $(PREFIX)/bin
#CFLAGS=-DDEBUG -g

all:baidu_pcs

baidu_pcs:
	gcc $(CFLAGS) -Wall -O2 baidu_pcs.c pcs.c pcs_file.c cJSON.c http_client.c iniparser.c dictionary.c -o ./baidu_pcs -lcurl -lm

install:baidu_pcs
	mkdir -p $(INSTALL_BIN)
	cp ./baidu_pcs $(INSTALL_BIN)/baidu_pcs
	cp ./etc/baidu_pcs.ini ~/.baidu_pcs.ini
	chmod 755 $(INSTALL_BIN)/baidu_pcs

uinstall:baidu_pcs
	rm -rf $(INSTALL_BIN)/baidu_pcs
	rm -rf ~/.baidu_pcs.ini

clean:
	rm ./baidu_pcs
