#include <stdio.h>

#define USE(x) asm volatile(""::"r"(x))

void use(int var)
{
	USE(var);
}

void  escape(int *var)
{
	printf("var=%d\n", *var);
}

void side_effect(void)
{
	printf("Hello\n");
}
