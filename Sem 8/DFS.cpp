#include<bits/stdc++.h>
#include<omp.h>
using namespace std;

vector<int>g[100];
bool v[100];

void dfs(int u){
    v[u]=1;
    cout<<u<<" ";

    #pragma omp parallel for
    for(int i=0;i<g[u].size();i++)
        if(!v[g[u][i]])
            dfs(g[u][i]);
}

int main(){
    int n,e,u,v1,s;
    cin>>n>>e;

    while(e--){
        cin>>u>>v1;
        g[u].push_back(v1);
        g[v1].push_back(u);
    }

    cin>>s;

    dfs(s);
}