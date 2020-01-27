# makefile fragment to be included by libtimidity.a users
# $Id: _timi.mak 5805 2017-01-29 21:40:23Z sezero $

ifdef DEBUG
TIMIDITY_BUILD = DEBUG=yes
endif
$(LIBS_DIR)/timidity/$(LIBTIMIDITY):
	$(MAKE) -C $(LIBS_DIR)/timidity $(TIMIDITY_BUILD) CC="$(CC)" AR="$(AR)" RANLIB="$(RANLIB)"

timi_clean:
	$(MAKE) -C $(LIBS_DIR)/timidity clean
