BUILD := docker-compose build
UP := docker-compose up -d
DOWN := docker-compose down
EXEC = docker-compose exec $(CONTAINER) bash $(ARG)
LINUX := linux
CONTAINER =
ARG = 
MAKE_LOG_FILES := mkdir -p ../files/logs && touch ../files/logs/{schedule.log,schedule-error.log}

build-up:
	$(eval CONTAINER := $(LINUX))
	$(eval ARG := -c "/etc/init.d/cron start && /etc/init.d/rsyslog restart && /bin/bash")
	@$(MAKE_LOG_FILES) && $(BUILD) && $(UP) && $(EXEC)
up:
	@$(MAKE_LOG_FILES) && $(UP)
down:
	@$(DOWN)
exec-linux:
	$(eval CONTAINER := $(LINUX))
	@$(EXEC)
up-stop-cron:
	$(eval CONTAINER := $(LINUX))
	$(eval ARG := -c "systemctl stop crond.service")
	@$(UP) && $(EXEC)