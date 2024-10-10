# cl-cookieproject

A [cookiecutter](https://github.com/audreyr/cookiecutter) template for Common Lisp projects featuring:

- A default qlot packages: sly
- Canonical Common Lisp project structure, a ready-to-use project with an entry point and unit tests.
- Run project from sources
- Build a binary
- and choose your Lisp implementation
- Test suite using [Fiveam](https://common-lisp.net/project/fiveam/docs/)
  - a [travis](https://travis-ci.org/) CI configuration file (untested)
- [Roswell](https://github.com/roswell/roswell/) recipe to build, install and share a binary
- example use of command line arguments
  (`uiop:command-line-arguments`). Proper parsing is left to do with a
  third-party library ([clingon](https://github.com/dnaeon/clingon), unix-opts, defmain, adopt…).


## Usage

cookie-cutter /path/or/url/to/this/repo project_name=foo

Then answer the questions.

### Slynk

Because we're using qlot, we don't want to `M-x sly` from inside
emacs.  Instead, we want to start the sbcl session using the runner in
the dir: `./run-slynk`, then `M-x sly-connect` to the running sbcl,
which listens on port 4008 by default.

### Run it

```bash
$ cd cookie-lisp-project
$ ./dosh run
sbcl --load run.lisp
This is SBCL 2.0.10, an implementation of ANSI Common Lisp.
More information about SBCL is available at <http://www.sbcl.org/>.

SBCL is free software, provided as is, with absolutely no warranty.
It is mostly in the public domain; some portions are provided under
BSD-style licenses.  See the CREDITS and COPYING files in the
distribution for more information.
To load "cffi":
  Load 1 ASDF system:
    cffi
; Loading "cffi"
.
To load "cookie-lisp-project":
  Load 1 ASDF system:
    cookie-lisp-project
; Loading "cookie-lisp-project"
[package cookie-lisp-project]
Hello from cookie-lisp-project!
*
```

You can see the `Hello` from the `main` function, and we are given a Lisp REPL.

### Build an executable

```bash
$ ./dosh build
[…]
[saving current Lisp image into /home/vince/bacasable/lisp-projects/cookie-lisp-project/cookie-lisp-project:
writing 0 bytes from the read-only space at 0x50000000
writing 736 bytes from the static space at 0x50100000
writing 37060608 bytes from the dynamic space at 0x1000000000
writing 2154496 bytes from the immobile space at 0x50200000
writing 13910016 bytes from the immobile space at 0x52000000
done]

$ ./cookie-lisp-project me
Hello me from cookie-lisp-project!

$ ./cookie-lisp-project -h
Usage:

  cookie-lisp-project [name]
```

Build it with Roswell:

```
$ ros build roswell/cookie-lisp-project.ros
```

A binary is created in the `roswell` directory.

Your users can install the application with:

```
$ ros install github_username/project_name
```


### Cookiecutter options

You can use command line options: https://cookiecutter.readthedocs.io/en/1.7.2/advanced/cli_options.html

- `--no-input`: do not prompt for parameters and only use cookiecutter.json file content
- ` --replay`: do not prompt for parameters and only use information entered previously
- ` -f, --overwrite-if-exists`: overwrite the contents of the output directory if it already exists
- ` -s, --skip-if-file-exists`: skip the files in the corresponding directories if they already exist
- ` -o, --output-dir`: where to output the generated project dir into
- ` --config-file`: user configuration file

The first time you run `cookiecutter` with a link to a GitHub repository, the skeleton is saved under `~/.cookiecutters/`. You can run the command for the second time with only the skeleton name:

    cookiecutter cl-cookieproject


## TODOs

- [ ] initialize a git repository
- [ ] better guess the author
- [ ] include a documentation system
- [X] [web project skeleton](https://github.com/vindarel/cl-cookieweb)
- [ ] more CI setup
- [ ] build a .deb (and .rpm)

---

Acknowledgement: we forked [cl-cookiecutter](https://github.com/kjinho/cl-cookieproject),
which forked [cookiecutter-cl](https://github.com/hbristow/cookiecutter-cl).
