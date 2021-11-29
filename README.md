# liburandom

## Overview

urandom (`/dev/urandom`) utility.

## Installation

```
make
make install
```

## Usage

```C
#include <stdio.h>
#include <stdlib.h>

#include <liburandom.h>

int main(int argc, char const *argv[]){
    unsigned int bufferLength = 100;
    unsigned char *buf;
    buf = (unsigned char *)calloc(sizeof(char), bufferLength);
    if (buf == NULL) {
        perror("memory allocation failed.\n");
        return 1;
    }

    int result = urandom(buf, bufferLength);
    if (result != URANDOM_OK){
        perror("urandom failed");
        return 1;
    }

    for(int i = 0; i < bufferLength; i++){
        printf("%02X ", buf[i]);
    }
    printf("\n");

    return 0;
}
```

On compiling:

```
gcc /path/to/file -lurandom
```
## License

This repository is published under MIT License.
In details, see [LICENSE](LICENSE).
