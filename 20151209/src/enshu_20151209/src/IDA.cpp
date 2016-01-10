#include <iostream>
#include <cstdio>
#include <climits>
#include <cmath>
#include <cassert>
#include <algorithm>
#include <utility>
#include <vector>
#include <string>
#include <stack>
#include <queue>
#include <map>

#define MAX 100
#define INFTY 1<<30 // 2^30
#define N 4
#define N2 16  // N * N
#define REP(i,n) for(int i=0;i<n;i++)

using namespace std;

typedef long long llong;

struct Puzzle
{
  int f[N2];
  int space, MD;
  bool operator < (const Puzzle &p) const
  {
    for(int i = 0; i < N2; i++)
    {
      if(f[i] == p.f[i]) continue;
      return f[i] > p.f[i];
    }
    return false;
  }
};

static const int dx[4] = {-1, 0, 1, 0};
static const int dy[4] = {0, -1, 0, 1};
static const char dir[4] = {'u', 'l', 'd', 'r'};

Puzzle state;
int limit;
int path[MAX];
int MDT[N2][N2];

int getAllMD(Puzzle pz)
{
  int sum = 0;
  REP(i,N2)
  {
    if(pz.f[i] == N2) continue;
    sum += MDT[i][pz.f[i] - 1];
  }
  return sum;
}

bool isSolved()
{
  for(int i = 0; i < N2; i++)
    if(state.f[i] != (i + 1)) return false;
  return true;
}

bool dfs(int depth, int prev)
{
  //cout << depth << "  " << prev << endl;
  if(state.MD == 0) return true;
  if(depth + state.MD > limit) return false;

  int sx = state.space / N;
  int sy = state.space % N;
  Puzzle tmp;
  REP(r,4)
  {
    int tx = sx + dx[r];
    int ty = sy + dy[r];
    if(tx < 0 || ty < 0 || tx >= N || ty >= N) continue;
    if(abs(prev-r) == 2) continue;
    tmp = state;

    state.MD -= MDT[tx*N+ty][state.f[tx*N+ty]-1];
    state.MD += MDT[sx*N+sy][state.f[tx*N+ty]-1];
    swap(state.f[tx*N+ty], state.f[sx*N+sy]);
    state.space = tx*N+ty;
    if(dfs(depth+1,r)){path[depth] = r; return true;}
    state = tmp;
  }
  return false;
}

string iterative_deepening(Puzzle in)
{
  in.MD = getAllMD(in);
  for(limit = in.MD; limit <= MAX; limit++)
  {
    state = in;
    if(dfs(0,-100))
    {
      string ans = "";
      REP(i, limit) ans += dir[path[i]];
      return ans;
    }
  }
  return "unsolvable";
}

int main()
{
  cin.tie(0);
  ios::sync_with_stdio(false);
  // FROM HERE
  REP(i,N2)
    REP(j,N2)
      MDT[i][j] = abs(i/N - j/N) + abs(i%N - j%N);

  Puzzle in;
  for(int i = 0; i < N2; i++)
  {
    cin >> in.f[i];
    if(in.f[i] == 0)
    {
      in.f[i] = N2;
      in.space = i;
    }
  }
  string ans = iterative_deepening(in);
  //cout << ans.size() << endl;
  cerr << ans << endl;
  // END
  return 0;
}
