// Copyright (c) 2014 cagayakemiracl All Rights Reserved.
// $Mail: <cagayakemiracl@gmail.com>

#include "orig.h"

int open_file(char *path, int kind) {
  int fd;

  fd = open(path, kind);
  if (fd == -1) {
    perror("open");
    exit(EXIT_FAILURE);
  }

  return fd;
}
