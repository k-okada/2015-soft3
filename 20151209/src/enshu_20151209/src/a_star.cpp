#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <map>
#include <string>
#include <algorithm>

using namespace std;

class city
{
public:
  string name;
  int dist;
  map<string, int> nextto;
  int cost = -1;
  int checked = 0;
  string prev = "";
  city(string name, int dist){
    this->name = name;
    this->dist = dist;
  }
  ~city(){}

  void addcity(string nextname, int nextdist){
    this->nextto.insert(map<string, int>::value_type(nextname, nextdist));
  }
  
};


void readfile(string src, map<string, city*>& citylist){
  ifstream ifs(src.c_str());
  string line;
  stringstream ssline;
  while(ifs && getline(ifs, line)){
    if(line.find('#') == 0){
      continue;
    }
    ssline.str("");
    ssline.clear(stringstream::goodbit);
    ssline.str(line);

    stringstream sstmp;
    string name;
    string nextname;
    string tmp;
    int dist;
    city* citytmp;
    getline(ssline, name, ' ');
    getline(ssline, tmp, ' ');
    sstmp.str(tmp);
    sstmp >> dist;
    citytmp = new city(name, dist);
    while(getline(ssline, nextname, ' ')){
      getline(ssline, tmp, ' ');
      sstmp.str("");
      sstmp.clear(stringstream::goodbit);
      sstmp.str(tmp);
      sstmp >> dist;
      citytmp->addcity(nextname, dist);
    }
    citylist.insert(pair<string, city*>(name, citytmp));
  }
}

city* a_star_search(map<string, city*>& citylist, string startcity){
  vector<city*> stack;
  city* popcity;
  stack.push_back(citylist[startcity]);
  citylist[startcity]->checked = 1;
  citylist[startcity]->cost = 0;
  
  while(stack.size()){
    //A*でソート(評価関数が最小のものを末尾へ)
    sort(stack.begin(), stack.end(), [](const city* x, const city* y){return (y->cost + y->dist) -(x->cost + x->dist);});
    //スタックの末尾取り出し
    popcity = stack.back();
    stack.pop_back();
    //ゴールかどうかチェック
    if(popcity->dist == 0){
      return popcity;
    }
    //周りをスタックに入れる
    for(map<string, int>::iterator itr = popcity->nextto.begin(); itr != popcity->nextto.end(); itr++){
      if(citylist[itr->first]->checked == 0){
	citylist[itr->first]->checked = 1;
	citylist[itr->first]->cost = popcity->cost + itr->second;
	citylist[itr->first]->prev = popcity->name;
	stack.push_back(citylist[itr->first]);
      }
    }
  }
  //ゴールを見つける前にスタックが空になった場合
  return NULL;
}

void trackback(map<string, city*> citylist, city* goal, string startcity){
  vector<city*> route;
  city* cityptr = goal;
  while(true){
    route.push_back(cityptr);
    if(cityptr->prev == ""){
      break;
    }
    cityptr = citylist[cityptr->prev];
  }
  reverse(route.begin(), route.end());
  
  //結果表示
  for(vector<city*>::iterator itr = route.begin(); itr != route.end(); itr++){
    cout << (*itr)->name << endl;
  }
}

int main(){
  map<string, city*> citylist;
  readfile("../data/romania2.dat", citylist);

  string startcity = "Oradea";
  city* goal = a_star_search(citylist, startcity);
  if(goal == NULL){
    cout << "Couldn't find the goal" << endl;
  }else{
    trackback(citylist, goal, startcity);
  }
  return 0;
}
