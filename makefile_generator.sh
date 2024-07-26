#!/bin/bash

read -p "Enter Project name:    " name

read -p "Enter the directory path where you want to create the file:    " file_path

full_path="$file_path/Makefile"

if ! mkdir -p "$file_path"; then
    echo "Failed to create directory: $file_path"
    exit 1
fi

c_files=$(find "$file_path" -maxdepth 1  -name '*.c' -exec basename {} \; | awk '{ printf "%s \\\n", $0 }')

if [ -z "$c_files" ]; then
    c_files="add files.c here \\" 
fi

cat << EOF > "$full_path"
NAME = $name

CC = cc

CFLAGS = -Wall -Wextra -Werror

RM = rm -f

SRC = $c_files

OBJ = \$(SRC:.c=.o)

all: \$(NAME)

\$(NAME): \$(OBJ)
	ar rc \$(NAME) \$(OBJ)

%.o: %.c $name.h
	\$(CC) \$(CFLAGS) -o \$@ -c \$<

clean:
	\$(RM) \$(OBJ)

fclean: clean
	\$(RM) \$(NAME)

re: fclean all
EOF

# Check if Makefile was created successfully
if [ -f "$full_path" ]; then
    echo "Makefile created successfully at $full_path"
else
    echo "Failed to create Makefile at $full_path"
fi

