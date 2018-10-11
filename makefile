MOD_NAME := Easy Custom Borders
MOD_CREATOR := DefKorns
MOD_CATEGORY := UI
MOD_FILENAME := $(shell basename "`git config --get remote.origin.url`" .hmod.git)

all: out/$(MOD_FILENAME).hmod

out/$(MOD_FILENAME).hmod:
	mkdir -p out/ temp/
	rsync -a mod/ temp/ --links --delete

	cd temp/; tar -czvf "../$@" *
	rm -r temp/
	touch "$@"

clean:
	-rm -rf out/

.PHONY: clean
