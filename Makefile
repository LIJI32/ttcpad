ttcpad: ttcpad.m 
	clang -O3  -Wall -Werror -fobjc-arc $^ -framework Foundation -o $@
	
clean:
	rm -f ttcpad