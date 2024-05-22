# Compiler and options
OCAMLC = ocamlc
OCAMLOPT = ocamlopt
OCAMLFLAGS = -g

# Directories containing source files
PARSER_DIR = ../parser
SCANNER_DIR = ../scanner
IR_DIR = ../ir

# Source files
PARSER_SOURCES = $(wildcard $(PARSER_DIR)/*.ml)
SCANNER_SOURCES = $(wildcard $(SCANNER_DIR)/*.ml)
IR_SOURCES = $(wildcard $(IR_DIR)/*.ml)
MAIN_SOURCE = pyn.ml

# Object files
PARSER_OBJECTS = $(PARSER_SOURCES:.ml=.cmo)
SCANNER_OBJECTS = $(SCANNER_SOURCES:.ml=.cmo)
IR_OBJECTS = $(IR_SOURCES:.ml=.cmo)
MAIN_OBJECT = $(MAIN_SOURCE:.ml=.cmo)

# Executable name
EXECUTABLE = pyn

# Default target
all: $(EXECUTABLE)

# Linking the executable
$(EXECUTABLE): $(PARSER_OBJECTS) $(SCANNER_OBJECTS) $(IR_OBJECTS) $(MAIN_OBJECT)
	$(OCAMLC) $(OCAMLFLAGS) -o $@ $^

# Compiling the main source file
$(MAIN_OBJECT): $(MAIN_SOURCE)
	$(OCAMLC) $(OCAMLFLAGS) -c $<

# Compiling parser files
$(PARSER_OBJECTS): %.cmo: %.ml
	$(OCAMLC) $(OCAMLFLAGS) -c $<

# Compiling scanner files
$(SCANNER_OBJECTS): %.cmo: %.ml
	$(OCAMLC) $(OCAMLFLAGS) -c $<

# Compiling IR files
$(IR_OBJECTS): %.cmo: %.ml
	$(OCAMLC) $(OCAMLFLAGS) -c $<

# Clean target to remove generated files
clean:
	rm -f $(PARSER_DIR)/*.cmo $(PARSER_DIR)/*.cmi
	rm -f $(SCANNER_DIR)/*.cmo $(SCANNER_DIR)/*.cmi
	rm -f $(IR_DIR)/*.cmo $(IR_DIR)/*.cmi
	rm -f *.cmo *.cmi $(EXECUTABLE)

.PHONY: all clean
