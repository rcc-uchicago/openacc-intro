#include <stdio.h>

#define SIZE 100

void initialize(int *a,int *b,int *c){
    int i;
    #pragma acc kernels
    {
        for(i=0;i< SIZE;i++){
            a[i]=1;
            b[i]=0;
            c[i]=2;
        }
        for(i=0;i<SIZE;i++){
            a[i]=b[i]+c[i];
        }
    }

}

int main()
{
    int a[SIZE],b[SIZE],c[SIZE];
    initialize(a,b,c);
    return 0;
}
     
