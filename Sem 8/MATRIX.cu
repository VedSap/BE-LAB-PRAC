// CUDA Matrix Multiplication
#include<stdio.h>
__global__ void mul(int*a,int*b,int*c){
    int r=threadIdx.y,c1=threadIdx.x,s=0;
    for(int k=0;k<2;k++) s+=a[r*2+k]*b[k*2+c1];
    c[r*2+c1]=s;
}
int main(){
    int a[]={1,2,3,4},b[]={5,6,7,8},c[4],*x,*y,*z;
    cudaMalloc(&x,16); cudaMalloc(&y,16); cudaMalloc(&z,16);

    cudaMemcpy(x,a,16,cudaMemcpyHostToDevice);
    cudaMemcpy(y,b,16,cudaMemcpyHostToDevice);

    mul<<<1,dim3(2,2)>>>(x,y,z);

    cudaMemcpy(c,z,16,cudaMemcpyDeviceToHost);

    for(int i=0;i<4;i++) printf("%d ",c[i]);
}