// DFS using OpenMP
#include<bits/stdc++.h>
#include<omp.h>
using namespace std;
vector<int>g[100];bool v[100];
void dfs(int u){
    v[u]=1;cout<<u<<" ";
    #pragma omp parallel for
    for(int i=0;i<g[u].size();i++)
        if(!v[g[u][i]]) dfs(g[u][i]);
}
int main(){ dfs(0); }