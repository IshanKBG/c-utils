#ifndef MEM_H
#define MEM_H

#include <stdlib.h>
#include "../defines.h"
// V - Table
typedef void* MemoryReserve(void *ctx, u64 size);
typedef void  M_ChangeMemoryFunc(void *ctx, void *ptr, u64 size);
struct M_BaseMemory {
  MemoryReserve *reserve;
  M_ChangeMemoryFunc *commit;
  M_ChangeMemoryFunc *decommit;
  M_ChangeMemoryFunc *release;
  void *ctx;
};
struct Arena {
 u8 *memory;
 u64 cap;
 u64 pos;
};
#define DEFAULT_RESEVE Gigabytes(1);
function void m_change_memory_noop(void *ptr, void *ctx, u64 size);
function struct Arena arena_reserve(M_BaseMemory *base, u64 reserved_size);
#endif
