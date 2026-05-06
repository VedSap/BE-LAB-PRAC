// CUDA Large Vector Addition
#include<stdio.h>
__global__ void add(int*a,int*b,int*c){
    int i=threadIdx.x;
    c[i]=a[i]+b[i];
}
int main(){
    int a[]={1,2,3,4,5},b[]={5,4,3,2,1},c[5],*x,*y,*z;
    cudaMalloc(&x,20); cudaMalloc(&y,20); cudaMalloc(&z,20);

    cudaMemcpy(x,a,20,cudaMemcpyHostToDevice);
    cudaMemcpy(y,b,20,cudaMemcpyHostToDevice);

    add<<<1,5>>>(x,y,z);

    cudaMemcpy(c,z,20,cudaMemcpyDeviceToHost);

    for(int i:c) printf("%d ",i);
}