#include<bits/stdc++.h>
#include<omp.h>
using namespace std;

int main(){
    int n;
    cin>>n;

    int a[n];
    for(int i=0;i<n;i++) cin>>a[i];

    for(int i=0;i<n;i++){
        #pragma omp parallel for
        for(int j=0;j<n-i-1;j++)
            if(a[j]>a[j+1])
                swap(a[j],a[j+1]);
    }

    for(int i=0;i<n;i++) cout<<a[i]<<" ";
}