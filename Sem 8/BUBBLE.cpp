// Bubble Sort using OpenMP
#include<bits/stdc++.h>
#include<omp.h>
using namespace std;
int main(){
    int a[]={5,4,3,2,1},n=5;
    for(int i=0;i<n;i++){
        #pragma omp parallel for
        for(int j=0;j<n-i-1;j++)
            if(a[j]>a[j+1]) swap(a[j],a[j+1]);
    }
    for(int x:a) cout<<x<<" ";
}