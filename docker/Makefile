
#########################################################
# imports
#########################################################

include .env

#########################################################
# variables
#########################################################

BUILD := docker-compose build
UP := docker-compose up -d
DOWN := docker-compose down
EXEC = docker-compose exec $(CONTAINER) bash $(ARG)
LINUX := linux
CONTAINER =
ARG =
MAKE_LOG_FILES := mkdir -p ../files/logs && touch ../files/logs/schedule.log && touch ../files/logs/schedule-error.log
CRON_STATUS := $(eval CONTAINER = $(LINUX)) $(eval ARG = -c "service cron status") $(EXEC)
CHECK_CRON_STATUS := printf "%s\e[32m%s\e[00m\n" \
	"Checking docker_linux_1 cronstatus ..." "`$(CRON_STATUS)`"

#########################################################
# if include source not exists commands
#########################################################

.env:
	@cp -n .env.example .env

#########################################################
# make commands
#########################################################

build-up:
	$(eval CONTAINER := $(LINUX))
	$(eval ARG = -c "service cron status && bash")
	@$(MAKE_LOG_FILES) && $(BUILD) && $(UP) && $(EXEC)
up:
	@$(MAKE_LOG_FILES) && $(UP) && $(CHECK_CRON_STATUS)
down:
	@$(DOWN)
remove:
	@$(DOWN) --rmi all --volumes --remove-orphans
exec-linux:
	$(eval CONTAINER := $(LINUX))
	$(eval ARG =)
	@$(EXEC)
up-stop-cron:
	$(eval CONTAINER := $(LINUX))
	$(eval ARG := -c "service cron stop")
	@$(UP) && $(EXEC)
cronstatus:
	@$(CHECK_CRON_STATUS)
stopcron:
	$(eval CONTAINER := $(LINUX))
	$(eval ARG := -c "service cron stop")
	@$(EXEC)
startcron:
	$(eval CONTAINER := $(LINUX))
	$(eval ARG := -c "service cron start")
	@$(EXEC)
restartcron:
	$(eval CONTAINER := $(LINUX))
	$(eval ARG := -c "service cron restart")
	@$(EXEC)