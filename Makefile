
CFLAGS += -no-pie -Iincludes
LDLIBS += -lm -ldl -lpng -lcrypto -lz

OBJS += libxpwn/8900.o
OBJS += libxpwn/ibootim.o
OBJS += libxpwn/img2.o
OBJS += libxpwn/img3.o
OBJS += libxpwn/libxpwn.o
OBJS += libxpwn/lzss.o
OBJS += libxpwn/lzssfile.o
OBJS += libxpwn/nor_files.o
OBJS += libxpwn/abstractfile.o
OBJS += mk8900image.o

%.o:	%.c
	$(CC) $(CFLAGS) -c $< -o $@

mk8900image: $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@ $(LDLIBS)

clean:
	@rm -f $(OBJS)
	@rm -f mk8900image
