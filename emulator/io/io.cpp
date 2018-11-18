#include "io.h"
#include <iostream>

/* Serial subsystem ports */
uint8_t serial_ports[] = {_serial_data_in_port, _serial_next_port, _serial_in_waiting_port, _serial_data_out_port, _serial_tx_busy_port, 0};

/* gfx subsytem ports */
uint8_t gfx_ports[] = {_key_in_waiting_port, _key_data_in_port, _key_next_port, _text_addr_port, _text_data_port, _gfx_addr_port, _gfx_data_port, 0};

/* check if a number occurs in a serial array */
uint8_t is_subsys(uint8_t port, uint8_t * subsys){
  while(*subsys){
    if(port == *(subsys++)){
      return 1;
    }
  }
  return 0;
}


/**
 * start the io subsystems */
void IO::init(char * serial_port){
  /* reset all subsytems */
  io_serial.reset();
  io_gfx.reset();

  /* init */
  io_serial.open(serial_port);
  io_gfx.init();
}

void IO::update(){
  io_gfx.update();
}

uint16_t IO::io_read(uint8_t port){
  if(is_subsys(port, serial_ports)){
    return io_serial.io_read(port);
  }
  if(is_subsys(port, gfx_ports)){
    return io_gfx.io_read(port);
  }

  std::cout << "Undefined Port Access";
  return 0;
}

void IO::io_write(uint8_t port, uint16_t val){
  if(is_subsys(port, serial_ports)){
    io_serial.io_write(port, val);
    return;
  }
  if(is_subsys(port, gfx_ports)){
    io_gfx.io_write(port, val);
    return;
  }

  std::cout << "Undefined Port Access";
}