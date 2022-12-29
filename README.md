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

This command shows the content of each section in hexadecimal format

`$ objdump -d <filename>`

This command decompiles all the sections that contain instructions.

## `readelf`

## `nm`

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

