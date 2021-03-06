check: spell shellcheck yaml-check markdownlint markdown-link-check check-usernames

shellcheck:
	cd cron-scripts; $(MAKE) $@

spell:
	cd docs; $(MAKE) $@

yaml-check:
	cd docs; $(MAKE) $@

markdownlint:
	cd docs; $(MAKE) $@

markdown-link-check:
	cd docs; $(MAKE) $@

check-usernames:
	cd docs; $(MAKE) $@
