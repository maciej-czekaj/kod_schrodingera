
#include <stdio.h>
#include <stdlib.h>


#define NOP(x) asm volatile("nop "#x"(%rax,%rax,1)\n")
#define USE(x) asm volatile(""::"r"(x))

void use(int var);
void escape(int *var);

int a,b;

int x,y,z;

int *bb = &b;

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

void kod3()
{
	a = 1;
	b = a + 2;
	asm volatile (
	"push %%rax\n"
	"pop %%rax\n"
	:::);
	a = 2;
	a = a + b + 3;
	use(a);
}

int main(int argc, char **argv)
{
	(void)argc;
	(void)argv;
	kod3();
	printf("b = %d\n",x);
	return 0;
}
