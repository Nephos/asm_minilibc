##
## Makefile for  in /home/poulet_a/asm
##
## Made by Arthur Poulet
## Login   <poulet_a@epitech.net>
##
## Started on  Wed Feb 11 17:14:59 2015 Arthur Poulet
## Last update Wed Feb 11 17:19:02 2015 Arthur Poulet
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

CCFLAGS		= -c -Wall

RM		= rm -f

all:		$(NAME)

$(NAME):	$(OBJS)
		@echo -e "linking of $@"
		$(CC) -o $(NAME) $(OBJS) $(CFLAGS)
		@echo -e "$(NAME) Compiled"

%.o:		%.S
		@echo -e "assemblage of $@"
		$(NASM) $(NASMFLAGS) -o $@ $<

%.o:		%.c
		@echo -e "compilation of $@"
		@$(CC) $(CCFLAGS) -o $@ $< #2>/dev/null

clean:
		$(RM) $(OBJS)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

test:		all
		./$(NAME)

.PHONY:		all clean fclean re test
