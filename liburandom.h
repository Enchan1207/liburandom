//
// /dev/urandomユーティリティ
//

#ifndef _LIB_URANDOM_H_
#define _LIB_URANDOM_H_

#include <stdio.h>
#include <stdlib.h>

// urandomの戻り値
#define URANDOM_OK 0  // 正常終了
#define URANDOM_READFAILED 1  // ファイル読み込み失敗
#define URANDOM_CLOSEFAILED 2 // ファイルクローズ失敗

int urandom(unsigned char* buf, unsigned int bufferLength);

#endif

