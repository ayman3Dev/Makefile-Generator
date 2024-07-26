#!/bin/bash

read -p "Enter Project name:    " name
read -p "Enter the directory path where you want to create the file:    " file_path

full_path="$file_path/Makefile"

if ! mkdir -p "$file_path"; then
    echo "Failed to create directory: $file_path"
    exit 1
fi

c_files=$(find "$file_path/mandatory" -maxdepth 2 -name '*.c' -exec basename {} \; | awk '{ printf "mandatory/%s \\\n", $0 }')
c_bfiles=$(find "$file_path/bonus" -maxdepth 2 -name '*.c' -exec basename {} \; | awk '{ printf "bonus/%s \\\n", $0 }')

if [ -z "$c_files" ]; then
    c_files="add mandatory .c files here \\"
fi

if [ -z "$c_bfiles" ]; then
    c_bfiles="add bonus .c files here \\"
fi

cat << EOF > "$full_path"
NAME = $name

BNAME = ${name}_bonus

CC = cc

CFLAGS = -Wall -Wextra -Werror

RM = rm -f

BSRC = $c_bfiles

SRC = $c_files

OBJ = \$(SRC:.c=.o)

BOBJ = \$(BSRC:.c=.o)

all: \$(NAME)

bonus: \$(BNAME)

\$(NAME): \$(OBJ)
	\$(CC) \$(CFLAGS) -o \$(NAME) \$(OBJ)

\$(BNAME): \$(BOBJ)
	\$(CC) \$(CFLAGS) -o \$(BNAME) \$(BOBJ)

mandatory/%.o: mandatory/%.c mandatory/$name.h
	\$(CC) \$(CFLAGS) -o \$@ -c \$<

bonus/%.o: bonus/%.c bonus/${name}_bonus.h
	\$(CC) \$(CFLAGS) -o \$@ -c \$<

clean:
	\$(RM) \$(OBJ) \$(BOBJ)

fclean: clean
	\$(RM) \$(NAME) \$(BNAME)

re: fclean all

.PHONY: all clean fclean re bonus
EOF

if [ -f "$full_path" ]; then
    echo "Makefile created successfully at $full_path"
else
    echo "Failed to create Makefile at $full_path"
fi
