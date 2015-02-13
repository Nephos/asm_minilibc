#include <stdio.h>
#include <assert.h>
#include <malloc.h>

# define S1 "abcdefghi"
# define S2 "abcdefgh"

size_t	strlen(const char *s);
int	strcmp(char *s1, char *s2);
char	*strcpy(char *dest, const char *src);

int	test_strcmp()
{
  char	*str1 = S1;
  char	*str2 = S2;
  char	*str3 = S1;

  printf("%s\t > \t%s ? %i\n", str1, str2, strcmp(str1, str2));
  /* assert(strcmp(str1, str2) > 0); */
  printf("%s\t < \t%s ? %i\n", str2, str1, strcmp(str2, str1));
  assert(strcmp(str2, str1) < 0);
  printf("%s\t == \t%s ? %i\n", str1, str1, strcmp(str1, str1));
  assert(strcmp(str1, str1) == 0);
  printf("%s\t == \t%s ? %i\n", str2, str2, strcmp(str2, str2));
  assert(strcmp(str2, str2) == 0);
  printf("%s\t == \t%s ? %i\n", str3, str3, strcmp(str3, str3));
  assert(strcmp(str2, str2) == 0);
  printf("%s\t == \t%s ? %i\n", str1, str3, strcmp(str1, str3));
  assert(strcmp(str2, str2) == 0);
  printf("%s\t == \t%s ? %i\n", str1, str3, strcmp(str3, str1));
  assert(strcmp(str2, str2) == 0);
  return (0);
}

int	test_strcpy()
{
  char	*str1 = S1;
  char	*str2 = malloc(strlen(S1) + 1);

  strcpy(str2, str1);
  printf("%s\t == \t%s ? %i\n", str1, str2, strcmp(str1, str2));
  assert(strcmp(str1, str2) == 0);
  str2 = S1;
  printf("%s\t == \t%s ? %i\n", str1, str2, strcmp(str1, str2));
  assert(strcmp(str1, str2) == 0);
  return (0);
}

int	main()
{
  printf("test STRCMP\n");
  test_strcmp();
  printf("test STRCPY\n");
  test_strcpy();
  printf("All tests passed with succes\n");
  return (0);
}
