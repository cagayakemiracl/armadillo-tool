// Copyright (c) 2014 cagayakemiracl All Rights Reserved.
// $Mail: <cagayakemiracl@gmail.com>

#include "orig.h"

int write_file(int fd, char *data)
{
  int len;
  len = write(fd, data, strlen(data));
  if (len == -1) {
    perror("write");
    exit(EXIT_FAILURE);
  }

  return len;
}

