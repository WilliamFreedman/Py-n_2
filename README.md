# Py-n_2

This repo is a continuation of a team project I worked on for my compilers class at Columbia, COMS4115 Programming Languages and Translators.
The original repo is available [here](https://github.com/WilliamFreedman/Py-n), but I decided to create this repo so the old one would contain
only the work we completed for the class, while this version contains all of the additional work I have added.

Next steps for Py^n, ordered by importance (this order might change):

- Adding indentation to the parser to allow it to insert INDENT and DEDENT tokens itself.
    - This is currently handled by the preprocessor, but it's given us more trouble than it's worth.
- Edit tester file for new parsing
- Fixing newline/blank line bugs in the parser. 
    - We are getting weird bugs with newlines after if statements, I think the entire way the cfg handles
    new lines should be reworked.
- Rudimentary documentation, for both the language itself and dependencies/usage.
- Note: After the above are finished, I will consider Py+^n 1.0 completed. I think those are the features that matter most
right now. Everything else below I would consider addons independent of our original project.
- Make the print function polymorphic.
    - Currently we have seperate prints for each type, we should be able to pass in any value to the generic print
        - Print version 1 will need to branch based on the type passed in, that will eventually be replaced by calls to
        __repr__
    - Possible idea: because functions currently can't be directly polymorphic, should print take in a "type_unsafe" type, 
    so it can take any value and assume the function definition handles that safely? Essenially Rust's unsafe for types?
- Structs
    - Useful for figuring out how to handle contguous data in Ocaml LLVM, plus I eventually want to implement lists, strings, 
    and objects as structs. 
- Fixed size arrays
    - Eventually I want dynamic lists like python has, but this is a useful stepping stone for figuring out the type system,
    indexing, etc.
- Lists and for loops
- Classes
- Subclasses/Polymorphism
    - Tree to represent subtyping relationships? The type of a list is the least common ancestor of all elements' types?
- Interfaces