// CUDA Parallel Reduction : Min Max Sum Avg
#include<stdio.h>
#include<limits.h>
__global__ void r(int*a,int*n,int*x,int*s){
    int i=threadIdx.x;
    atomicMin(n,a[i]);
    atomicMax(x,a[i]);
    atomicAdd(s,a[i]);
}
int main(){
    int a[]={1,2,3,4,5},mn=INT_MAX,mx=INT_MIN,sum=0,*d,*n,*x,*s;
    cudaMalloc(&d,20); cudaMalloc(&n,4); cudaMalloc(&x,4); cudaMalloc(&s,4);
    cudaMemcpy(d,a,20,cudaMemcpyHostToDevice);
    cudaMemcpy(n,&mn,4,cudaMemcpyHostToDevice);
    cudaMemcpy(x,&mx,4,cudaMemcpyHostToDevice);
    cudaMemcpy(s,&sum,4,cudaMemcpyHostToDevice);

    r<<<1,5>>>(d,n,x,s);

    cudaMemcpy(&mn,n,4,cudaMemcpyDeviceToHost);
    cudaMemcpy(&mx,x,4,cudaMemcpyDeviceToHost);
    cudaMemcpy(&sum,s,4,cudaMemcpyDeviceToHost);

    printf("Min=%d\nMax=%d\nSum=%d\nAvg=%f",mn,mx,sum,sum/5.0);
}