
BIN_LIB=CMPSYS
LIBLIST=$(BIN_LIB) CLV1
SHELL=/QOpenSys/usr/bin/qsh

all: jsonpg01.sqlrpgle xmlpgm01.sqlrpgle

%.sqlrpgle:
	system -s "CHGATR OBJ('/home/CLV/xmljsonex/qrpglesrc/$*.sqlrpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTSQLRPGI OBJ($(BIN_LIB)/$*) SRCSTMF('/home/CLV/xmljsonex/qrpglesrc/$*.sqlrpgle') COMMIT(*NONE) DBGVIEW(*SOURCE) OPTION(*EVENTF) OBJTYPE(*PGM) RPGPPOPT(*LVL2)"