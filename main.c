#include <assert.h>

int	strcmp(char *s1, char *s2);

int	test_strcmp()
{
  assert(strcmp("abc", "ab") == 1);
  assert(strcmp("ab", "abc") == -1);
  assert(strcmp("abc", "abc") == 0);
  return (0);
}

int main()
{
  test_strcmp();
  return (0);
}
