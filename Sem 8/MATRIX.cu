#include<stdio.h>

__global__ void mul(int*a,int*b,int*c,int n){
    int r=threadIdx.y,c1=threadIdx.x,s=0;

    for(int k=0;k<n;k++)
        s+=a[r*n+k]*b[k*n+c1];

    c[r*n+c1]=s;
}

int main(){
    int n;
    scanf("%d",&n);

    int a[n][n],b[n][n],c[n][n];

    for(int i=0;i<n;i++)
        for(int j=0;j<n;j++)
            scanf("%d",&a[i][j]);

    for(int i=0;i<n;i++)
        for(int j=0;j<n;j++)
            scanf("%d",&b[i][j]);

    int *x,*y,*z;

    cudaMalloc(&x,n*n*4);
    cudaMalloc(&y,n*n*4);
    cudaMalloc(&z,n*n*4);

    cudaMemcpy(x,a,n*n*4,cudaMemcpyHostToDevice);
    cudaMemcpy(y,b,n*n*4,cudaMemcpyHostToDevice);

    mul<<<1,dim3(n,n)>>>(x,y,z,n);

    cudaMemcpy(c,z,n*n*4,cudaMemcpyDeviceToHost);

    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++)
            printf("%d ",c[i][j]);
        printf("\n");
    }
}