# enfist init Makefile
# This file included by ../../Makefile
SHELL               = /bin/bash
# Docker image version tested for actual dcape release
ENFIST_VER0        ?= v0.6.12

#- ******************************************************************************
#- Enfist: internal config

#- Database name and database user name
ENFIST_DB_TAG      ?= enfist
#- Database user password
ENFIST_DB_PASS     ?= $(shell openssl rand -hex 16; echo)
#- apisite/app-enfist docker image version
ENFIST_VER         ?= $(ENFIST_VER0)

NAME=ENFIST
DB_INIT_SQL=apps/enfist/migrate.sql
# ------------------------------------------------------------------------------

-include $(CFG)
export

ifdef DCAPE_STACK
include $(DCAPE_ROOT)/$(CFG)
include $(DCAPE_ROOT)/Makefile.dcape
else
include $(DCAPE_ROOT)/Makefile.app
endif


# ------------------------------------------------------------------------------

init:
	@if [[ "$$ENFIST_VER0" != "$$ENFIST_VER" ]] ; then \
	  echo "Warning: ENFIST_VER in dcape ($$ENFIST_VER0) differs from yours ($$ENFIST_VER)" ; \
	fi
	@echo "  URL: $(DCAPE_SCHEME)://$(DCAPE_HOST)/conf/"

#mydb: NAME=PDNS
#mydb: DB_INIT_SQL=$(APP_ROOT)/schema.pgsql.sql
#mydb: db-create

setup: db-create
	@cmd=create ; \
	$(MAKE) -s dc CMD="run --rm config make poma-install"
