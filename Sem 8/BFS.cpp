#include<bits/stdc++.h>
#include<omp.h>
using namespace std;

vector<int>g[100];
bool v[100];

int main(){
    int n,e,u,v1,s;
    cin>>n>>e;

    while(e--){
        cin>>u>>v1;
        g[u].push_back(v1);
        g[v1].push_back(u);
    }

    cin>>s;

    queue<int>q;
    q.push(s);
    v[s]=1;

    while(!q.empty()){
        int u=q.front(); q.pop();
        cout<<u<<" ";

        #pragma omp parallel for
        for(int i=0;i<g[u].size();i++){
            int x=g[u][i];
            if(!v[x]){
                v[x]=1;
                q.push(x);
            }
        }
    }
}