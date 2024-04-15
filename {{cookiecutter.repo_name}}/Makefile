LISP ?= sbcl

SBCL_ARGS =
SBCL_BUILD_ARGS =
ifeq ($(LISP),sbcl)
	SBCL_ARGS = --no-userinit
	SBCL_BUILD_ARGS = --non-interactive
endif

LISP_ARGS ?= $(SBCL_ARGS)
LISP_BUILD_ARGS = $(SBCL_BUILD_ARGS)


all: test

run:
	$(LISP) \
		$(LISP_ARGS) \
		--load .qlot/setup.lisp \
		--load run.lisp

build:
	$(LISP) \
		$(LISP_ARGS) \
		$(LISP_BUILD_ARGS) \
		--load .qlot/setup.lisp \
		--load {{ cookiecutter.project_name}}.asd \
		--eval '(ql:quickload :{{ cookiecutter.project_name}})' \
		--eval '(asdf:make :{{ cookiecutter.project_name}})'

test:
	$(LISP) \
		$(LISP_ARGS) \
		$(LISP_BUILD_ARGS) \
		--load .qlot/setup.lisp \
		--load run-tests.lisp
