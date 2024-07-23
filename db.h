#ifndef _DB_H
#define _DB_H

#define DB_DIR "/home/wss/.local/share/devpkg"
#define DB_FILE "/home/wss/.local/share/devpkg/db"

int DB_init();
int DB_list();
int DB_update(const char *url);
int DB_find(const char *url);

#endif