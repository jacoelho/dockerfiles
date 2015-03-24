BASE    = jacoelho
CMD     = docker build --no-cache --rm
TARGETS = gemdata systemdata mongodata postgresqldata

.PHONY: push 

all: $(TARGETS) 

gemdata: GemDataContainer
	$(CMD) -t $(BASE)/$@ -f $< .

systemdata: SystemDataContainer
	$(CMD) -t $(BASE)/$@ -f $< .

mongodata: MongoDataContainer
	$(CMD) -t $(BASE)/$@ -f $< .

postgresqldata: PostgresqlDataContainer
	$(CMD) -t $(BASE)/$@ -f $< .

push: $(TARGETS)
	@for IMAGE in $(TARGETS); do \
		docker $(BASE)/$$IMAGE; \
	done
