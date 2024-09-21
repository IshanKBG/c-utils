#include "mem.h"
#include <stdlib.h>

function void* m_malloc_reserve(void *ctx,  u64 size){
  return(malloc(size));
}
function void m_malloc_release(void *ctx, void *ptr, u64 size){
  free(ptr);
}

function  struct M_BaseMemory* m_malloc(void){
  local struct M_BaseMemory memory = {0};
  if (memory.reserve == NULL) {
      memory.reserve = m_malloc_reserve;
      memory.commit = m_change_memory_noop;
      memory.decommit = m_change_memory_noop;
      memory.release = m_malloc_release;
   }
    return(&memory);
}
