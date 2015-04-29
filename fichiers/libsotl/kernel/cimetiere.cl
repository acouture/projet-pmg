// naive parallel
  /*
  const int n = end - begin;
  __local int temp[2*TILE_SIZE];
  
  //int thid = get_global_id(0);
  int pout = 0, pin = 1;
  // load input into shared memory.
  // This is exclusive scan, so shift right by one and set first elt to 0
  temp[pout * TILE_SIZE + lid] = (gid > 0) ? box_buff[gid-1] : 0;
  barrier(CLK_LOCAL_MEM_FENCE);

  for(int offset = 1; offset < n; offset *= 2) {
    pout = 1 - pout; // swap double buffer indices
    pin = 1 - pout;
    if(gid >= offset)
      temp[pout * TILE_SIZE + lid] += temp[pin * TILE_SIZE + lid - offset];
    else
      temp[pout * TILE_SIZE + lid] = temp[pin * TILE_SIZE + lid];
    barrier(CLK_LOCAL_MEM_FENCE);
  }

  calc_offset_buff[gid] = temp[pout * TILE_SIZE + lid]; // write output
  */

  // efficient parallel
  // Init
  /*
  calc_offset_buff[gid] = box_buff[gid];
  int n = end - begin;
  
  if (gid >= end / 2)
    return;

  int offset = 1;
  // Prescan
  for(int d = n>>1 ; d > 0 ; d >>= 1) {
    barrier(CLK_GLOBAL_MEM_FENCE);
    if (gid < d) {
      unsigned index1 = offset * (2*gid + 1);
      unsigned index2 = offset * (2*gid + 2);
      calc_offset_buff[index2] = box_buff[index1] + box_buff[index2];
    }
    offset *= 2;
  }

  // clear the last element
  if (gid == 0)
    calc_offset_buff[n - 1] = 0;

  // Scan
  for (int d = 1 ; d < n ; d *= 2) {
    offset >>= 1;
    barrier(CLK_GLOBAL_MEM_FENCE);

    if (gid < d) {
      unsigned index1 = offset * (2*gid + 1);
      unsigned index2 = offset * (2*gid + 2);

      int tmp = calc_offset_buff[index1];
      calc_offset_buff[index1] = calc_offset_buff[index2];
      calc_offset_buff[index2] += tmp;
    }
  }
  
  barrier(CLK_GLOBAL_MEM_FENCE);
  */

  // Non-fucktionnal Super efficient parallel IV
  /*
  __local int temp[TILE_SIZE];

  temp[lid] = box_buff[gid];
  barrier(CLK_LOCAL_MEM_FENCE);

  // prefix sum sur temp
  if(lid == 0)
    if(group_id == num_groups-1){
      for(int i = 1; i < TILE_SIZE; i++){
        if (gid+i < end)
          temp[i] += temp[i-1];
        else
          temp[i] = temp[i-1];
      }
    }
    else{
      for(int i = 1; i < TILE_SIZE; i++){
        temp[i] += temp[i-1];
      }
    }
  barrier(CLK_LOCAL_MEM_FENCE);

  // un thread par groupe sauvegarde le max de son temp
  if (lid == 0)
    box_buff[group_id] = temp[TILE_SIZE-1];
  barrier(CLK_GLOBAL_MEM_FENCE);

  // un seul thread fait un prefix sum sur les max sauvegardés
  if(gid == 0){
    for(int i = 1; i < num_groups; i++)
      box_buff[i] += box_buff[i-1];
  }
  barrier(CLK_GLOBAL_MEM_FENCE);
  
  if(group_id > 0){
    temp[lid] += box_buff[group_id - 1];
  }
    
  barrier(CLK_LOCAL_MEM_FENCE);

  if(lid == 0){
    for(int i = 0; i < TILE_SIZE; i++)
      calc_offset_buff[gid+i] = temp[i];
  }

  calc_offset_buff[gid] = temp[0];
  */