#include<stdio.h>

__global__ void add(int*a,int*b,int*c){
    int i=threadIdx.x;
    c[i]=a[i]+b[i];
}

int main(){
    int n;
    scanf("%d",&n);

    int a[n],b[n],c[n];

    for(int i=0;i<n;i++) scanf("%d",&a[i]);
    for(int i=0;i<n;i++) scanf("%d",&b[i]);

    int *x,*y,*z;

    cudaMalloc(&x,n*4);
    cudaMalloc(&y,n*4);
    cudaMalloc(&z,n*4);

    cudaMemcpy(x,a,n*4,cudaMemcpyHostToDevice);
    cudaMemcpy(y,b,n*4,cudaMemcpyHostToDevice);

    add<<<1,n>>>(x,y,z);

    cudaMemcpy(c,z,n*4,cudaMemcpyDeviceToHost);

    for(int i=0;i<n;i++) printf("%d ",c[i]);
}