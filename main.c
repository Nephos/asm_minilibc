#include <stdio.h>
#include <assert.h>
#include <malloc.h>

int	strcmp(char *s1, char *s2);
int	strcpy(char *dest, char *src);

int	test_strcmp()
{
  char	*str1 = "abc";
  char	*str2 = "ab";

  assert(strcmp(str1, str2) == 1);
  assert(strcmp(str2, str1) == -1);
  assert(strcmp(str1, str1) == 0);
  assert(strcmp(str2, str2) == 0);
  return (0);
}

int	test_strcpy()
{
  char	*str1 = "abcdefghi";
  char	*str2 = "---------";

  strcpy(str2, str1);
  assert(strcmp(str1, str2) == 0);
  assert(strcmp(str1, str2) == 0);
  return (0);
}

int	main()
{
  test_strcmp();
  printf("All tests passed with succes\n");
  return (0);
}
