// Merge Sort using OpenMP
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
    int a[]={5,4,3,2,1};
    ms(a,0,4);
    for(int x:a) cout<<x<<" ";
}