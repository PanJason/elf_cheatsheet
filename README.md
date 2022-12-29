# ELF Cheatsheet
The repo contains the cheatsheet for ELF related, linking related commands, a template for `Makefile`, the bracket conventions and useful C attributes.
# Build
```
$ make all
```
To make all object files and executables.

```
$ make TinyHelloWorld-manual
```
To manually link the object file with the ld script in `lds/`.

```
$ make clean
```
To clean up

In `bin` and `obj`, there are demo executable and object files respectively. They can be used to test the command below.

# Cheatsheet
## `file`
`$ file <filename>`

This command shows the ELF type (i.e. relocatable, executable, shared object, core dump), target platform.

## `size`
`$ size <filename>`

This command shows the size of each section of an ELF.

## `objdump`
`$ objdump -h <filename>`

This command shows the informantion of section headers, including size, vma, lma, offset, align and attributes.

`$ objdump -x <filename>`

This command shows the section header informantion, the symbol table, the relocation tables (one table for each section that requires relocation).

`$ objdump -s <filename>`

This command shows the content of each section in hexadecimal format.

`$ objdump -d <filename>`

This command decompiles all the sections that contain instructions.

`$ objdump -t <filename>`

This command shows the symbol table of an ELF.

## `readelf`
`$ readelf -h <filename>`

This command shows the header of an ELF.

`$ readelf -S <filename>`

This command shows the information of section headers, similar to `objdump -h`.

`$ readelf -s <filename>`

This command shows the symbol table of an ELF, similar to `objdump -t`.

## `nm`
`$ nm <filename>`

This command shows the symbol table of an ELF, similar to `objdump -t`.

## Makefile
```
all : a b
```
- `$@` evaluates to `all`
- `$<` evaluates to `a`
- `$^` evaluates to `a b`

## Bracket Conventions
The conventiosn are defined in [Ch. 12 - Utility Conventions](https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html) and the gist is listed below:

- square brackets `[optional option]`
- angle brackets `<required argument>`
- curly brackets `{default values}`
- parenthesis `(miscellaneous info)`

## C Attributes
```c
__attribute__((section("<name>"))) // Place the variable or function in section "name"
__attribute__((weak)) // Define a weak symbol (covered by strong symbol). A weak symbol will have type SHN_COMMON (in common block)
__attribute__((weakref)) // Define a reference to external functions as weak reference.
__attribute__((nocommon)) // Do not mark the symbol as `SHN_COMMON`. Instead define it as a strong symbol.
```
