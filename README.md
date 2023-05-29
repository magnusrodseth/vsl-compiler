# VSL Compiler

## A general note

Because this compiler features a lot of assembly code on the ELF format, the preferred way to run this is using a Linux machine. Personally, I use a Mac, so the easiest way I found to run this is to open the entire project using **GitHub Codespaces**, and then coding and running the project in the browser or using remote Visual Studio Code. On GitHub, navigate to `Code -> Codespaces -> + -> Open in... -> Browser or Visual Studio Code`. This will open the project in a Linux environment, and you can run the code using the commands below.

## Running the application

First, ensure that [`flex`](https://github.com/westes/flex) and [`bison`](https://www.gnu.org/software/bison/) are installed on your machine. On Mac, these can both be installed using [`homebrew`](https://brew.sh/). Then, run the following commands to compile the source code and generate the executable:

```sh
# Navigate to the project
cd vsl-compiler

# Clean and compile source code
make purge && make

# Navigate to the directory of .vsl files
cd vsl_programs

# Clean, compile the assembly code, and generate the executable
make clean && make ps6 && make ps6-assemble
```

## Executing the generated code

Now you can run executable code based on the demo programs provided.

```sh
# Navigate to the directory with generated executables
cd ps6-codegen2

# Run executable code
./array.out
./break.out
./for.out
./if.out
./sieve.out
./simple_if.out
./while.out
```

## For the curious ones

Ensure that Graphviz is installed on your machine. On Mac, this can be installed using [`homebrew`](https://formulae.brew.sh/formula/graphviz).

All commands below assumes that you have a purged and clean build of the source code, as instructed above.

```sh
# Navigate to the directory of .vsl files
cd vsl_programs

# Clean and check the generated syntax tree (*.ast) with the expected one (*.ast.suggested)
make clean && make ps2 && make ps2-check

# Clean and generate the Graphviz representation of the AST
make clean && make ps3 && make ps3-graphviz

# Clean and generate the symbol table, string list and bound syntax tree
make clean && make ps4

# Clean, compile the assembly code, and generate the executable
make clean && make ps5 && make ps5-assemble

# Clean, compile the assembly code, and generate the executable (with if, while and break statements)
make clean && make ps6 && make ps6-assemble
```
