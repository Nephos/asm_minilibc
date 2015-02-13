#include <stdio.h>
#include <assert.h>
#include <malloc.h>

# define S1 "abcdefghi"
# define S2 "abcdefgh"
# define SE ""

size_t	strlen(const char *s);
int	strcmp(char *s1, char *s2);
char	*strcpy(char *dest, const char *src);
void	*memset(void *s, int c, size_t n);
int	strncmp(const char *s1, const char *s2, size_t n);

int	test_strlen()
{
  printf("%s size : 9", S1);
  assert(strlen(S1) == 9);
  printf("%s size : 8", S2);
  assert(strlen(S2) == 8);
  printf("%s size : 0", SE);
  assert(strlen(SE) == 0);
  return (0);
}

int	test_strcmp()
{
  char	*str1 = S1;
  char	*str2 = S2;
  char	*str3 = S1;

  printf("%s\t > \t%s ? %i\n", str1, str2, strcmp(str1, str2));
  assert(strcmp(str1, str2) > 0);
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

int	test_strncmp()
{
  char	*str = S1;

  assert(strncmp(str, S1, strlen(S1)) == 0);
  assert(strncmp(str, S2, strlen(S1) - 1) == 0);
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

int	test_memset()
{
  char	*str = malloc(10);

  memset(str, 'a', 9);
  str[9] = 0;
  printf("%s == aaaaaaaaa\n", str);
  assert(strcmp("aaaaaaaaa", str) == 0);
  return (0);
}

int	main()
{
  printf("test STRLEN\n");
  test_strlen();
  printf("test STRCMP\n");
  test_strcmp();
  printf("test STRNCMP\n");
  test_strncmp();
  printf("test STRCPY\n");
  test_strcpy();
  printf("test MEMSET\n");
  test_memset();
  printf("All tests passed with succes\n");
  return (0);
}
