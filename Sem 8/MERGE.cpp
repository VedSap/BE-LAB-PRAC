#include<bits/stdc++.h>
#include<omp.h>
using namespace std;

void ms(int a[],int l,int r){
    if(l>=r)return;

    int m=(l+r)/2;

    #pragma omp parallel sections
    {
        #pragma omp section
        ms(a,l,m);

        #pragma omp section
        ms(a,m+1,r);
    }

    inplace_merge(a+l,a+m+1,a+r+1);
}

int main(){
    int n;
    cin>>n;

    int a[n];
    for(int i=0;i<n;i++) cin>>a[i];

    ms(a,0,n-1);

    for(int i=0;i<n;i++) cout<<a[i]<<" ";
}