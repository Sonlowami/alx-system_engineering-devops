#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

/**
 * main - create a zombie process
 *
 * Return: 0 always
 */
int main(void)
{
	int i;
	int pid;

	for (i = 0; i < 5; i++)
	{
		pid = fork();
		if (pid > 0)
			printf("Zombie process created, PID: %d\n", pid);
		else
			return (0);
	}
	return (0);
}
