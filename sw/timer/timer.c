#include <or1k-support.h>
#include <or1k-sprs.h>

#include <stdio.h>

char* gpio_base = (char*) 0x91000000;

unsigned char dat = 0x00;

extern void *_or1k_impure_ptr;

int main(void)
{

  /* Set the GPIO to all out */
  char dir = 0xff;
  *(gpio_base+1) = dir;
  /* Initialise with the first data value */
  *(gpio_base+0) = dat;

  uint32_t ticks = 0;
  uint32_t timerstate;
  or1k_timer_init(100);

  or1k_timer_enable();
  while (1) {
    while (ticks == or1k_timer_get_ticks()) { }
    ticks++;
    timerstate = or1k_timer_disable();
    // do something atomar
    or1k_timer_restore(timerstate);
    if (ticks == 100) {
      printf("A second elapsed\n");
      // Increment the GPIO counter
      *(gpio_base+0) = (++dat)%256;
      or1k_timer_reset_ticks();
      ticks = 0;
    }
  }
  
  return 0;
}
