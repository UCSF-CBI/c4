check: spell shellcheck yaml-check markdownlint markdown-link-check check-usernames check-here-links

cron-shellcheck:
	cd cron-scripts; $(MAKE) $@

## Backward compatibility /HB 2022-01-12
shellcheck: cron-shellcheck

markin-shellcheck:
	cd docs; $(MAKE) $@

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

check-here-links:
	cd docs; $(MAKE) $@
