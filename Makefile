#Generic Makefile for c compilation with explanations

#MAKEFILE BASE SETUP

#Added to avoid problems for make if SHELL is defined by environment elsewhere
SHELL = /bin/sh
#In case different make programs have different suffix lists and implicit rules
#Done to improve portability. First line clears list, second adds only suffixes
#needed for this particular makefile.
.SUFFIXES:
.SUFFIXES: .c .o

#MACROS

__MKDIR ?= mkdir -p


#VARIABLES

#= is to recursively expand vars(any variables are expanded and those inside)
#:= simply expand only first level e.g var= $(vars) only expands vars once and
#none of those inside prevents infinite recursion Cflags = $(Cflags)
#?= assigns if not already, =+ appends to value of variable.
#****REMEMBER you can set vars at cli "make [target] FOO=bar" *****

TARGET_EXEC ?= test
BUILD_DIR ?= ./build
SRC_DIR ?= ./src

#makes list of source files of cpp, c and assembly (commented out)
C_SRC := $(shell find $(SRC_DIR) -name *.c)

#CPP_SRC := $(shell find $(SRC_DIR) -name *.cpp)
#ASMB_SRC := $(shell find $(SRC_DIR) -name *.s)
#ALL_SRC_F := $(shell find $(SRC_DIR) -name *.s -or -name *.cpp -or -name *.c)


#makes list of c object files in build dir (generic vers commented out)
OBJS := $(C_SRC:%=$(BUILD_DIR)/%.o)
#OBJS := $(ALL_SRC_F:%=$(BUILD_DIR)/%.o)


#-D is macro define flag and g3 is highest debug inclusion level
DEBUG_FLAGS = -D DEBUG -g3
LFLAGS = 
#max optimization with pedantic (ISOC/C++ and stops forbidden extensions)
#and strict aliasing(pointers to same address warning)
CFLAGS = -std=gnu11 -O3 -Wall -Wextra -Wpedantic -Wstrict-aliasing 
CC = gcc
CPP = gcc
#CPPFLAGS ?= $(CLFAGS) -MMD -MP

#INCLUDES
LIB_FLAGS = #-l
#gets list of directory names in src directory
INC_DIRS :=$(shell find $(SRC_DIR) -type d)
#Adds the -I flag to the INC_DIRS list so var is not so nested and = is not need
INC_FLAGS := $(addprefix -I,$(INC_DIRS))


#EXECUTABLE RULES
#remembr the .o file rule below will not compile if there isn't a call for it 
#in the prereqs of another rule. Same with all % pattern rules.

#puts target in build directory
$(BUILD_DIR)/$(TARGET_EXEC) : $(OBJS)
	$(CC) $^ -o $@ $(LFLAGS)


#DEPENDENCY RULES

# Original version. Works by being called first as a dependency so mkdir macro
# will run pulling directory name/path from 'dir' command. Then by using $@ the
# path of the src file is included in the -o build flag retaining src structure.
# This path is also necessary for target build as we can use $^ or $(OBJS) which
# will include the path dynamically than statically if we were to rename the dir
# to 'objects' instead of src.
$(BUILD_DIR)/%.c.o : %.c
	$(__MKDIR) $(dir $@)
	$(CC) $(CFLAGS) $(LIB_FLAGS) -c $< -o $@

#assembly version
#$(BUILD_DIR)/%.a.o : %.s
#	$(__MKDIR) $(dir $@)
#	$(AS) $(ASFLAGS) -c $< -o $@

#cpp version
#$(BUILD_DIR)/%.cpp.o : %.cpp
#	$(__MKDIR) $(dir $@)
#	$(CPP) $(CPPFLAGS) -c $< -o $@


#generic version
#Rule below compiles all .c files to .o files, -c compiles and does not link(ma
#kes .o files) -o for named file output
#$@ is target of rule (target is left of : and right is prereqs for that target
# % is pattern rule prereq (finds all matching following pattern), $<name of 
#first prereq, $^ names of all prereq with spaces between.

#%*.o : %*.c
#	$(CC) $< -o $@ $(CFLAGS)

#OTHER RULES

#@ symbol is used at beginning of recipe to not print execution
clean:
	@rm build -r
