##
## Makefile for  in /home/poulet_a/asm
##
## Made by Arthur Poulet
## Login   <poulet_a@epitech.net>
##
## Started on  Wed Feb 11 17:14:59 2015 Arthur Poulet
## Last update Tue Mar 17 16:18:33 2015 Arthur Poulet
##

NAME		=	libasm.so

NAMETEST	=	testing

SRCSTEST	=	main.c

SRCS		=	strlen.S \
			strcmp.S \
			strcpy.S \
			memset.S \
			memcpy.S \
			index.S \
			strstr.S \
			strmore.S \
			strdup.S

OBJS		=	$(SRCS:.S=.o)

OBJSTEST	=	$(SRCSTEST:.c=.o)

NASM		=	nasm

CC		=	gcc

NASMFLAGS	=	-f elf64

CFLAGS		=	-c -Wall -Wextra -Werror -g

RM		=	rm -f

all:		$(NAME)

$(NAME):	$(OBJS)
		@echo -e "linking of $@"
		$(CC) -o $(NAME) $(OBJS) -shared -fPIC
		@echo -e "$(NAME) Compiled"

%.o:		%.S
		$(NASM) $(NASMFLAGS) -o $@ $<

%.o:		%.c
		$(CC) $(CFLAGS) -o $@ $<

clean:
		$(RM) $(OBJS)
		$(RM) $(OBJSTEST)

fclean:		clean
		$(RM) $(NAME)
		$(RM) $(NAMETEST)

re:		fclean all

test:		all $(NAMETEST)
		LD_PRELOAD="./$(NAME)" ./$(NAMETEST)

$(NAMETEST):	$(OBJSTEST)
		$(CC) -o $(NAMETEST) $(OBJSTEST)

.PHONY:		all clean fclean re test
