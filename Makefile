install: mcg
	test -f /usr/bin/mcg && rm /usr/bin/mcg || continue
	sudo cp -r ./mcg /usr/bin/mcg
	chmod +x /usr/bin/mcg
	@echo "Done!"
