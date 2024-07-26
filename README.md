# Makefile-Generator
This Bash script generates a Makefile for a C project.

Script Usage
1. Clone the Repository:

    First, clone this repository to your local machine:

    **git clone https://github.com/ayman3Dev/Makefile-Generator.git**

2. Navigate to the Script Directory:
 
    **cd your-repository**

3. Make sure the script is executable. If not, change its permissions:
   
    **chmod +x makefile_generator.sh**
   
    **chmod +x makefile_with_bonus.sh**

4. Run the script:

    **./makefile_generator.sh**
   
    **./makefile_with_bonus.sh**
   
6. Follow the Prompts:

    The script will prompt you to enter:
    Project name: The name of your project.
    Directory path: The path where you want to create the Makefile.

    Example:
  
    <img width="801" alt="image" src="https://github.com/user-attachments/assets/7fe4aa54-970a-420a-a36a-7e121dbd2fd7">

Makefile Overview
The generated Makefile includes:

Variables:

NAME: The name of the executable for mandatory files.
CC: The compiler to use.
CFLAGS: Compiler flags.
RM: Command to remove files.
Rules:

all: Builds the main executable.
clean: Removes object files.
fclean: Removes executables and object files.
re: Rebuilds everything from scratch.

Example Usage

To build the main executable:
**make**

To clean up object files:
**make clean**

To remove all generated files:
**make fclean**

To rebuild everything:
**make re**

