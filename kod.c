
#include <stdio.h>
#include <stdlib.h>

void use(int var);
void escape(int *var);
void side_effect(void);

int a,b;

// Side effects and escape analysis

void code_1a()
{
	int a,b;
	a = 1;
	b = a + 2;
	printf("Hello");
	a = b + 1;
	use(a);
	b = a + 1;
	use(b);
}

void code_1b()
{
	int a,b;
	a = 1;
	b = a + 2;
	printf("Hello");
	a = b + 1;
	escape(&a);
	b = a + 1;
	use(b);
}

void code_1c()
{
	a = 1;
	b = a + 2;
	printf("Hello");
	a = b + 1;
	use(a);
	b = a + 1;
	use(b);
}

// volatile & compiler barrier

void code_1d()
{
	int a;
	a = 1;
	b = a + 2;
	asm volatile("":::"memory");
	a = b + 1;
	use(a);
	b = a + 1;
	use(b);
}

// Loop invariant

int code_2a(int a, int n)
{
	int i, sum = 0;
	for (i = 0; i < n; i++) {
		if (a == 0)
			sum += 1;
		else
			sum += 2;
	}
	return sum;
}

int code_2c(int a, int n)
{
	int i, sum = 0;
	for (i = 0; i < n; i++) {
		escape(&a);
		if (a % 2 == 0)
			sum += 2;
		else
			sum += 1;
	}
	return sum;
}


// Aliasing

int code_3a(int *a, int *b, int n)
{
  int i, sum=0;
  for (i = 0; i < n; i++) {
    a[i] += b[0];
  }
  return sum;
}

int code_3b(int *a, int *b, int n)
{
  int i, sum=0;
  int b0 = b[0];
  for (i = 0; i < n; i++) {
    a[i] += b0;
  }
  return sum;
}


int code_3c(int * __restrict__ a, int * __restrict__ b, int n)
{
  int i, sum=0;
  for (i = 0; i < n; i++) {
    a[i] += b[0];
  }
  return sum;
}


int code_3d(int * __restrict__ a, int * __restrict__ b, int n)
{
  int i, sum=0;
  escape(b);
  for (i = 0; i < n; i++) {
    side_effect();
    a[i] += b[0];
  }
  return sum;
}

int main(int argc, char **argv)
{
	(void)argc;
	(void)argv;
	printf("b = %d\n",b);
	return 0;
}

// vim: tabstop=2 shiftwidth=2 expandtab
