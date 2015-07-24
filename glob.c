#include <stdio.h>

#define USE(x) asm volatile(""::"r"(x))

int __attribute__((const)) use(int *var)
{
	return *var;
}

void  escape(int *var)
{
	printf("var=%d\n", *var);
}
