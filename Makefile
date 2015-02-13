##
## Makefile for  in /home/poulet_a/asm
##
## Made by Arthur Poulet
## Login   <poulet_a@epitech.net>
##
## Started on  Wed Feb 11 17:14:59 2015 Arthur Poulet
## Last update Fri Feb 13 13:49:34 2015 Arthur Poulet
##

NAME		= testing

CSRCS		= main.c

ASRCS		= strcmp.S

AOBJS		= $(ASRCS:.S=.o)
COBJS		= $(CSRCS:.c=.o)
OBJS		= $(AOBJS)\
		  $(COBJS)

NASM		= nasm

CC		= gcc

NASMFLAGS	= -f elf64

CFLAGS		= -c -Wall

LFLAGS		= -Wall

RM		= rm -f

all:		$(NAME)

$(NAME):	$(OBJS)
		@echo -e "linking of $@"
		$(CC) -o $(NAME) $(OBJS) $(LFLAGS)
		@echo -e "$(NAME) Compiled"

%.o:		%.S
		$(NASM) $(NASMFLAGS) -o $@ $<

%.o:		%.c
		$(CC) $(CFLAGS) -o $@ $<

clean:
		$(RM) $(OBJS)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

test:		all
		./$(NAME)

.PHONY:		all clean fclean re test
