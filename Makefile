CC      = gcc

# OpenSSL 路径配置（针对 Homebrew 安装）
OPENSSL_INCLUDE = /opt/homebrew/opt/openssl@3/include/openssl
OPENSSL_LIB = -L//opt/homebrew/opt/openssl@3/lib -lssl

CFLAGS   += -I $(OPENSSL_INCLUDE) -g -std=gnu99 -O3
LDFLAGS  += $(OPENSSL_LIB) -lcrypto -lpthread

NAME     = jwtcrack
SRCS     = main.c base64.c
OBJS     = $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) -o $(NAME) $(OBJS) $(LDFLAGS)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all
