#
#
#
build_path = build
build_dylib_name = liburandom.dylib
shared_include_directory = /usr/local/include
shared_lib_directory = /usr/local/lib
current_dir = `pwd`

#
.PHONY: __dummy__ build install uninstall 

__dummy__:
	@echo "make {build|install|uninstall}"

build:
	@mkdir -p $(build_path)

	@echo "compiling..."
	@gcc -c liburandom.c
	@mv *.o $(build_path)

	@echo "archiving..."
	@cd $(build_path); gcc -dynamiclib -o $(build_dylib_name) *.o

install:
	@echo "Installing..."
	install build/liburandom.dylib $(shared_lib_directory)/
	install liburandom.h $(shared_include_directory)/

uninstall:
	@rm $(shared_include_directory)/liburandom
	@rm $(shared_lib_directory)/$(build_dylib_name)
	@cd $(build_path);rm -f *