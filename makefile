#
#
#
build_path = build
build_header_name = liburandom.h
build_dylib_name = liburandom.dylib
shared_include_directory = /usr/local/include
shared_lib_directory = /usr/local/lib
current_dir = `pwd`

#
.PHONY: build install uninstall 

build:
	@mkdir -p $(build_path)

	@echo "compiling..."
	@gcc -c liburandom.c
	@mv *.o $(build_path)

	@echo "generate dylib..."
	@cd $(build_path); gcc -dynamiclib -o $(build_dylib_name) *.o

install:
	@echo "Installing..."
	install $(build_path)/$(build_dylib_name) $(shared_lib_directory)/
	install $(build_header_name) $(shared_include_directory)/

uninstall:
	@rm $(shared_include_directory)/$(build_header_name)
	@rm $(shared_lib_directory)/$(build_dylib_name)
	@cd $(build_path);rm -f *