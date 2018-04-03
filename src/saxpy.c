#include "ticktock.h"

void saxpy(int n, float a, float *x, float *restrict y){
  int i;
  #pragma acc kernels
  for (i=0; i<n; i++)
    y[i] = a * x[i] + y[i];
}//end of saxpy


int main(){
  int n=1e7; float a = 5./3.;int i;
  float *x = malloc(sizeof(float)*n);
  float *y = malloc(sizeof(float)*n);
  float temp;
  
  //initialize vectors  
  for (i=0; i<n; i++){
    x[i] = 2.0f;
    y[i] = (i+1.0)*(i-1.0);
  }
  tick_tock tt;
  tick(&tt);
  saxpy(n,a,x,y);
  tock(&tt);
  free(x);
  free(y);
  return 0;
}

