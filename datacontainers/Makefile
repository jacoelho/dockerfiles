BASE    = jacoelho
CMD     = docker build --no-cache --rm
TARGETS = gemdata systemdata mongodata postgresqldata

.PHONY: push 

all: $(TARGETS) 

gemdata: GemDataContainer
	$(CMD) -t jacoelho/$@ -f $< .

systemdata: SystemDataContainer
	$(CMD) -t jacoelho/$@ -f $< .

mongodata: MongoDataContainer
	$(CMD) -t jacoelho/$@ -f $< .

postgresqldata: PostgresqlDataContainer
	$(CMD) -t jacoelho/$@ -f $< .

push: $(TARGETS)
	@for IMAGE in $(TARGETS); do \
		docker $(BASE)/$$IMAGE; \
	done
