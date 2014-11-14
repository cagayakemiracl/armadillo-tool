// Copyright (c) 2014 cagayakemiracl All Rights Reserved.
// $Mail: <cagayakemiracl@gmail.com>

#include "orig.h"

#define LED_CLASS_PATH "/sys/class/leds"

static void cat_path(char *path, char *color) {
  snprintf(path, PATH_MAX, "%s/%s/brightness", LED_CLASS_PATH, color);
}

void control_led(char *color, int state) {
  char path[PATH_MAX];
  int fd;

  cat_path(path, color);
  fd = open_file(path, O_WRONLY);

  if (state) {
    write_file(fd, "1");
  } else {
    write_file(fd, "0");
  }

  close(fd);
}
