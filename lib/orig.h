// Copyright (c) 2014 cagayakemiracl All Rights Reserved.
// $Mail: <cagayakemiracl@gmail.com>

#ifndef _ORIG_H_
#define _ORIG_H_

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <limits.h>

#define RED "red"
#define GREEN "green"
#define YELLOW "yellow"

int open_file(char *path, int kind);
int write_file(int fd, char *data);

void control_led(char *color, int state);
void turn_on_led(char *color);
void turn_off_led(char *color);

int str2int(char *str);

#endif // _ORIG_H_
