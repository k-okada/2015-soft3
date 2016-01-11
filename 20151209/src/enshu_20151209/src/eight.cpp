#include<iostream>
#include<string>
#include<map>
#include<queue>
#include<vector>
using namespace std;

struct Puzzle{
  vector<int> panel;
  int space,cnt;
  Puzzle(vector<int> _p, int s, int c){
    panel = _p;
    space = s;
    cnt = c;
  }
  Puzzle(){}
};

bool check(vector<int> p){
  for(int i=0; i < 9;i++){
    if(p[i] != i)return false;
  }
  return true;
}

class LT{
public:
  bool operator()(Puzzle p1, Puzzle p2){
    int h1=p1.cnt,h2=p2.cnt;
    for(int i=0; i < 9;i++)if(p1.panel[i]!=i)h1++;
    for(int i=0; i < 9;i++)if(p2.panel[i]!=i)h2++;
    return h1>h2;
  }
};

int d[4] = {1,-1,3,-3};
int bfs(Puzzle s){
  map<vector<int>,bool> m;
  queue<Puzzle> que;
  que.push(s);
  m[s.panel]=true;
  int count =0;
  while(!que.empty()){
    count++;
    Puzzle now = que.front();
    que.pop();
    if(check(now.panel)){
      cout<<"takes "<<count<<"time(s)"<<endl;
      return now.cnt;
    }
    int idx1 = now.space;
    for(int i=0; i < 4;i++){
      int idx2 = idx1+d[i];
      if(idx2<0||idx2>=9)continue;
      vector<int> next_panel;
      next_panel = now.panel;
      next_panel[idx2]=now.panel[idx1];
      next_panel[idx1]=now.panel[idx2];
      Puzzle next(next_panel,idx2,now.cnt+1);

      if(m.count(next.panel)==0){
	m[next.panel]=true;
	que.push(next);
      }
    }
  }
  return -1;
}
int bfs_star(Puzzle s){
  map<vector<int>,bool> m;
  priority_queue<Puzzle,vector<Puzzle>,LT> que;
  que.push(s);
  m[s.panel]=true;
  int count =0;
  while(!que.empty()){
    count++;
    Puzzle now = que.top();
    que.pop();
    if(check(now.panel)){
      cout<<"takes "<<count<<"time(s)"<<endl;
      return now.cnt;
    }
    int idx1 = now.space;
    for(int i=0; i < 4;i++){
      int idx2 = idx1+d[i];
      if(idx2<0||idx2>=9)continue;
      vector<int> next_panel;
      next_panel = now.panel;
      next_panel[idx2]=now.panel[idx1];
      next_panel[idx1]=now.panel[idx2];
      Puzzle next(next_panel,idx2,now.cnt+1);

      if(m.count(next.panel)==0){
	m[next.panel]=true;
	que.push(next);
      }
    }
  }
  return -1;
}


int main(){
  vector<int> panel;
  int space=0;
  int init_panel[9]=
    {8,7,6,5,4,3,2,1,0};
  for(int i=0; i < 9; i++){
    panel.push_back(init_panel[i]);
    if(init_panel[i]==0)space=i;
  }
  Puzzle s(panel,space,0);
  cout << "bfs" <<endl;
  cout << bfs(s) << endl;
  cout << "star" <<endl;
  cout << bfs_star(s) << endl;
 
  return 0;
}
