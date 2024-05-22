#!/bin/bash

# Ensure at least one argument is passed
if [ $# -eq 0 ] || [ $# -gt 2 ]; then
    echo $#
    echo "Usage: $0 [-a|-s|-l|-r] <filename>"
    exit 1
fi

OPTSTRING="aslr"

mode_arg=""
to_run=1

# Process options
while getopts ${OPTSTRING} opt; do
  case ${opt} in
    a)
      echo "Printing AST"
      mode_arg="-a"
      to_run=0
      ;;
    s)
      echo "Printing SAST"
      mode_arg="-s"
      to_run=0
      ;;
    l)
      echo "Executing intermediate code"
      mode_arg="-l"
      to_run=0
      ;;
    r)
      echo "Executing program"
      mode_arg=""
      ;;
    *)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done

# Shift the processed options away to get the filename
shift $((OPTIND - 1))

# Ensure a filename is provided
if [ -z "$1" ]; then
    echo "Error: No filename provided."
    exit 1
else
    filename="$1"
fi

# Filename for the preprocessed output
modified_filename="preprocessed.pyn"

# Preprocess the file
ocamlc -o preprocessor str.cma preprocessor.ml

# Remove intermediate OCaml compilation files
rm preprocessor.cmo preprocessor.cmi

# Run the preprocessor
./preprocessor "$filename" "$modified_filename"

# Build the main program
ocamlbuild -r -pkgs llvm pyn.native

# Execute the appropriate actions based on the mode
if [ "$to_run" -eq 1 ]; then
    echo "Executing LLVM code"
    cat "$modified_filename" | ./pyn.native -l > "$modified_filename.ll"
    lli "$modified_filename.ll"
else
    cat "$modified_filename" | ./pyn.native $mode_arg
fi

# Optionally, remove temporary files
# rm "$modified_filename.ll"
# rm pyn.native
