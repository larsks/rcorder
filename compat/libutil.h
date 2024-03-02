/*
 * rcorder wants <libutil.h>, but libbsd install it as
 * <bsd/libutil.h>. We can't simply use -I/usr/include/bsd because
 * this results in recursive includes, so instead we use this
 * file as a proxy.
 */
#include <bsd/libutil.h>
