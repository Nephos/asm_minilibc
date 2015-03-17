int main()
{
  char *a = malloc(2);
  char *b = malloc(2);
  a[0] = 'a';
  a[1] = 0;
  a[0] = 'B';
  a[1] = 0;
  printf("%i\n", strcasecmp(a, b));
  printf("%i\n", strcasecmp(b, a));
  return 0;
}
