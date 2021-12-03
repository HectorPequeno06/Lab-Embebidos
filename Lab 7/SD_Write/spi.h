#ifndef SPI_H_
#define SPI_H_

#define BAUDRATE 9600

void spiInit( void );
uint8_t spiSend( uint8_t data );
#include "myprintf.h"

#endif /* SPI_H_ */