
#include <stdio.h>


#define NOP(x) asm volatile("nop "#x"(%rax,%rax,1)\n")
#define USE(x) asm volatile(""::"r"(x))

void use(int var);
void escape(int *var);

int a,b;

void kod1()
{
	int a,b;
	a = 1;
	b = a + 2;
	printf("Hello");
	a = 2;
	use(a);
	a = 3;
	use(b);
}

void kod2()
{
	a = 1;
	b = a + 2;
	printf("Hello");
	a = 2;
	use(a);
	a = 3;
	use(b);
}


int main(int argc, char **argv)
{
	(void)argc;
	(void)argv;
	kod1();
	return 0;
}
