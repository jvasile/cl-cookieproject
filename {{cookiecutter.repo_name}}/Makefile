LISP ?= sbcl

all: test

run:
ifeq ($(LISP),sbcl)
	$(LISP) \
		--no-userinit \
		--load .qlot/setup.lisp \
		--load run.lisp
else
	$(LISP) \
		--load .qlot/setup.lisp \
		--load run.lisp
endif

build:
ifeq ($(LISP),sbcl)
	$(LISP)	\
		--non-interactive \
		--no-userinit \
		--load .qlot/setup.lisp \
		--load {{ cookiecutter.project_name}}.asd \
		--eval '(ql:quickload :{{ cookiecutter.project_name}})' \
		--eval '(asdf:make :{{ cookiecutter.project_name}})'
else
	$(LISP)	\
		--load .qlot/setup.lisp \
		--load {{ cookiecutter.project_name}}.asd \
		--eval '(ql:quickload :{{ cookiecutter.project_name}})' \
		--eval '(asdf:make :{{ cookiecutter.project_name}})'
endif

test:
ifeq ($(LISP),sbcl)
	$(LISP) \
		--non-interactive \
		--no-userinit \
		--load .qlot/setup.lisp \
		--load run-tests.lisp
else
	$(LISP) \
		--load .qlot/setup.lisp \
		--load run-tests.lisp
endif
