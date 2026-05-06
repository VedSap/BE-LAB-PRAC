// BFS using OpenMP
#include<bits/stdc++.h>
#include<omp.h>
using namespace std;
vector<int>g[100];bool v[100];
int main(){
    queue<int>q;q.push(0);v[0]=1;
    while(!q.empty()){
        int u=q.front();q.pop();cout<<u<<" ";
        #pragma omp parallel for
        for(int i=0;i<g[u].size();i++){
            int x=g[u][i];
            if(!v[x]) v[x]=1,q.push(x);
        }
    }
}