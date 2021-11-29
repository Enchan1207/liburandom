//
// /dev/urandomユーティリティ
//

#include "liburandom.h"

/**
 * @fn 
 * @brief /dev/urandom から乱数を取得する関数
 * @param buf 結果を格納するバッファ
 * @param bufferLength バッファの長さ
 * @return int 取得結果(liburandom.hの定数に従う)
 */
int urandom(unsigned char* buf, unsigned int bufferLength){
    FILE *fp;
    fp = fopen("/dev/urandom", "r");

    if (fp == NULL){
        perror("liburandom: random file not found.\n");
        return URANDOM_READFAILED;
    }
    fread(buf, sizeof(char), bufferLength, fp);

    if (fclose(fp) != 0){
        perror("liburandom: failed to close file stream.\n");
        return URANDOM_CLOSEFAILED;
    }

    return URANDOM_OK;
}
