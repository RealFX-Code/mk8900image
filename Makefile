
CFLAGS += -no-pie -L/usr/lib -lm -ldl -lpng -lcrypto -lz \
	-Iincludes

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
	$(CC) $(CFLAGS) $(OBJS)$(LIBRARIES) -o $@

clean:
	@rm -f $(OBJS)
	@rm -f mk8900image
