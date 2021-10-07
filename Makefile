# Copyright (c) 2015-2018 David Dahlberg <dyn+code@dahlberg.cologne>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

PREFIX   = /usr/local
BINDIR   = $(PREFIX)/bin
SHAREDIR = $(PREFIX)/share
MANDIR   = $(PREFIX)/man
fetch    = ftp -MVo

all: fetch
	mandoc -Wall,stop -Tmarkdown src/pwg.1 > README.md

fetch:
	$(fetch) contrib/eff_large_wordlist.txt \
		https://www.eff.org/files/2016/07/18/eff_large_wordlist.txt
	$(fetch) contrib/eff_short_wordlist_1.txt \
		https://www.eff.org/files/2016/09/08/eff_short_wordlist_1.txt
	$(fetch) contrib/eff_short_wordlist_2_0.txt \
		https://www.eff.org/files/2016/09/08/eff_short_wordlist_2_0.txt
	$(fetch) contrib/diceware.wordlist.asc \
		https://theworld.com/~reinhold/diceware.wordlist.asc
	$(fetch) contrib/put.c \
		https://cvsweb.openbsd.org/cgi-bin/cvsweb/~checkout~/src/lib/libskey/put.c
	$(fetch) contrib/pgp.wordlist.txt \
		https://gist.githubusercontent.com/marswh/e4d9a4de199b798f255b/raw/f195c2f69c511ad945292ef369893eb660576842/pgp.wordlist.txt

install: fetch
	install -D -m 755 src/pwg $(BINDIR)
	install -D -m 644 src/pwg.1 $(MANDIR)/man1
	install -d -m 755 $(SHAREDIR)/pwg
	install -D -m 644 contrib/* $(SHAREDIR)/pwg

uninstall:
	rm -rf $(BINDIR)/pwg $(MANDIR)/man1/pwg.1 $(SHAREDIR)/pwg

test:
	mandoc -Wall,stop -Tlint src/pwg.1
	@echo success 
