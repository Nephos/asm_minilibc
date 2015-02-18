#include <stdio.h>
#include <assert.h>
#include <malloc.h>

# define S1 "abcdefghi"
# define S2 "abcdefgh"
# define SE ""

size_t	strlen(const char *s);
int	strcmp(char *s1, char *s2);
int	strncmp(const char *s1, const char *s2, size_t n);
char	*strcpy(char *dest, const char *src);
char	*strncpy(char *dest, const char *src, size_t n);
void	*memset(void *s, int c, size_t n);
char	*strchr(const char *s, int c);
void	*memcpy(void *dest, const void *src, size_t n);

int	test_strlen()
{
  printf("%s size : 9\n", S1);
  assert(strlen(S1) == 9);
  printf("%s size : 8\n", S2);
  assert(strlen(S2) == 8);
  printf("%s size : 0\n", SE);
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
  char	*str1 = S1;
  char	*str2 = S2;

  printf("%s == %s, %i\n", str1, S1, strncmp(str1, S1, strlen(S1)));
  assert(strncmp(str1, S1, strlen(S1)) == 0);
  printf("%s == %s, %i\n", str2, S2, strncmp(str1, S1, strlen(S1)));
  assert(strncmp(str1, S2, strlen(S1) - 1) == 0);
  str2 = SE;
  printf("%s\t == \t%s ? %i\n", str1, str2, strcmp(str1, str2));
  assert(strcmp(str1, str2) > 0);
  printf("%s\t\t == \t%s ? %i\n", str2, str1, strcmp(str2, str1));
  assert(strcmp(str2, str1) < 0);
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

int	test_strncpy()
{
  char	*str = malloc(strlen(S1) + 1);

  strncpy(str, S2, strlen(S2) + 1);
  printf("%s\t == \t%s ? %i\n", str, S2, strcmp(str, S2));
  assert(strcmp(str, S2) == 0);
  memset(str, 0, strlen(S1) + 1);
  strncpy(str, S1, strlen(S1) - 1);
  printf("%s\t == \t%s ? %i\n", str, S2, strcmp(str, S2));
  assert(strcmp(str, S2) == 0);
  return (0);
}

int	test_memset()
{
  char	*str = malloc(51);

  memset(str, 'a', 9);
  str[9] = 0;
  printf("%s == aaaaaaaaa\n", str);
  assert(strcmp("aaaaaaaaa", str) == 0);
  return (0);
}

int	test_strchr()
{
  char	*str = S1;
  char	c4 = str[4];

  assert(strchr(str, c4) == str + 4);
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
  printf("test MEMSET\n");
  test_memset();
  printf("test STRCPY\n");
  test_strcpy();
  printf("test STRNCPY\n");
  test_strncpy();
  printf("test STRCHR\n");
  test_strchr();
  printf("All tests passed with succes\n");
  return (0);
}
