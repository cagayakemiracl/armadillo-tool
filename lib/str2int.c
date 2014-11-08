// Copyright (c) 2014 cagayakemiracl All Rights Reserved.
// $Mail: <cagayakemiracl@gmail.com>

#include "orig.h"

int str2int(char *str)
{
  int ret, num;
  ret = sscanf(str, "%20d", &num);
  if (ret != 1) {
    perror("num");
    exit(EXIT_FAILURE);
  }

  return num;
}

