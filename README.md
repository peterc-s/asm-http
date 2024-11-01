# asm-http
Web server in x86-64 assembly built for Linux.

## Requirements
- The Flat Assembler (fasm)
- A Linux machine

## Build
To build the binary:
```bash
make
```

To build and run:
```bash
make run
```

To clean up artifacts:
```bash
make clean
```

To generate constants from `constants.c`
```bash
make constants
```

## Features
Serves only `index.html` no matter what request it gets. Needs a bit of work...
