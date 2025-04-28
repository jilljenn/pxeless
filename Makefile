all: nonos-24-04-2.iso

nonos-24-04-2.iso: user-data.2025
	sudo docker run --rm --volume "$(PWD):/data" \
		--user $(id -u):$(id -g) deserializeme/pxeless \
		--all-in-one  \
		--user-data user-data.2025 \
		--code-name noble \
		--use-release-iso \
		--destination $@

nonos-mini.iso: user-data.2025mini
	sudo docker run --rm --volume "$(PWD):/data" \
		--user $(id -u):$(id -g) deserializeme/pxeless \
		--all-in-one  \
		--user-data user-data.2025mini \
		--code-name noble \
		--use-release-iso \
		--destination $@	

clean:
	rm -f nonos-24-04-1.iso ubuntu-autoinstall.iso
