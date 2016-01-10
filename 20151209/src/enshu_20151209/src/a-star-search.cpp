#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <map>
#include <queue>
#include <stack>
#include <assert.h>
#include <unistd.h>
#include <algorithm>
#include <list>
#include <string.h>

using namespace std;
class Node {
public:

  int state;
  Node *parentptr;
  int action;
  int depth;
  int pathCost;
  int evalValue;
  Node(int s, Node * p, int cost, int eval) {
    state = s;
    parentptr = p;
    if (parentptr == NULL) {
      depth = 1;
      pathCost = 0;
      evalValue = 0;
    } else {
      depth = parentptr->depth + 1;
      pathCost = parentptr->pathCost + cost;
      evalValue = eval;
    }
  }
  ~Node() {
  }
  Node(const Node & node) {
    state = node.state;
    parentptr = node.parentptr;
    depth = node.depth;
  }
  Node * parent() {
    if (parentptr != NULL)
      return parentptr;

    else
      return this;
  }
  static int count;
  static vector < Node * >all;
  static Node *factory() {
    return factory(-1, NULL, 0, 0);
  }
  static Node *factory(int s) {
    return factory(s, NULL, 0, 0);
  }
  static Node *factory(int s, Node * p, int cost, int eval) {
    Node * retval = new Node(s, p, cost, eval);
    all.push_back(retval);
    count++;
    return retval;
  }

  static void freeall() {
    for (int i = 0; i < all.size(); i++)
      delete all[i];
    all.clear();
  }

  bool operator==(const Node & n) {
    return (state == n.state);
  }
  bool operator!=(const Node & n) {
    return (state == n.state);
  }
};
int Node::count = 0;
vector < Node * >Node::all;
typedef pair<string, int> node;
class Problem {
public:map <string, int >indices;
  vector < node > nodes;
  vector < vector < int > > successors;
  vector < vector < int > > weights;

  int n() {
    return nodes.size();
  }
  int nSuccessors(int i) {
    return successors[i].size();
  }
  Problem() {
  }
  ~Problem() {
  }
  void addSuccessor(string src, string dst, int w) {
    successors[indices[src]].push_back(indices[dst]);
    weights[indices[src]].push_back(w);
  }

  void addSuccessorPair(string a, string b, int w) {
    addSuccessor(a, b, w);
    addSuccessor(b, a, w);
  }
  void readFile(string filename) {
    ifstream in(filename.c_str());
    assert(in);
    nodes.clear();
    char line[1024];
    while (in.getline(line, sizeof(line), '\n')) {
      if (line[0] != '#') {
	cout << line << endl;
	char *delimiters = " \t\n";
	int wordcount = 0;
	char *wordptr1, *wordptr2;
	wordptr1 = strtok(line, delimiters);
	string source(wordptr1);
	wordptr2 = strtok(NULL, delimiters);
	string heuristic(wordptr2);
	cerr << ">> " << source << "/" << heuristic << endl;
	addNode(source, atoi(heuristic.c_str()));
      }
    }
    in.close();
    for (int i = 0; i < nodes.size(); i++) {
      indices[nodes[i].first] = i;
    } vector < int >dummy;
    successors.assign(n(), dummy);
    weights.assign(n(), dummy);

    ifstream in2(filename.c_str());
    assert(in2);
    while (in2.getline(line, sizeof(line), '\n')) {
      if (line[0] != '#') {
        char *delimiters = " \t\n";
        int wordcount = 0;
        char *wordptr1, *wordptr2;
        wordptr1 = strtok(line, delimiters);
        string source(wordptr1);
        wordptr2 = strtok(NULL, delimiters);
        string heuristic(wordptr2);
	assert(nodeExists(node(source,atoi(heuristic.c_str()))));
	while (((wordptr1 = strtok(NULL, delimiters)) != NULL) && ((wordptr2 = strtok(NULL, delimiters)) != NULL)) {
	  wordcount ++;
	  string destination(wordptr1);
	  string stepcost(wordptr2);
	  addSuccessor(source, destination, atoi(stepcost.c_str()));
	}
      }
    }
    in2.close();
  }

  bool nodeExists(node nod) {
    for (vector <node>::iterator it = nodes.begin();
	 it != nodes.end(); it++) {
      if (nod == *it)
	return true;
    }
    return false;
  }
  void addNode(string name, int value) {
    if (!nodeExists(node(name, value))) {
      nodes.push_back(node(name, value));
    }
  }
  void print() {
    int bmax = 0;
    for (int i = 0; i < n(); i++) {
      cout << nodes[i].first << " <" << nodes[i].second << "> (" <<  nSuccessors(i) << "):: ";
      bmax = bmax > nSuccessors(i) ? bmax : nSuccessors(i);
      for (int j = 0; j < nSuccessors(i); j++) {
	cout << nodes[successors[i][j]].first << "(" << weights[i][j] << "),";
      } cout << endl;
    } cout << "Max breadth b " << bmax << endl;
  }
};


class Queue:public deque < Node * > {
public:
  Node * First() {
    return front();
  };
  void Insert(Node * n) {
    return push_front(n);
  };
  Node * RemoveFirst() {
    Node * r = First();
    pop_front();
    return r;
  };
};

bool less_eval_function(const Node *n1, const Node *n2) {
  return (n1->evalValue < n2->evalValue);
}

int main(int argc, char *argv[])
{
  int c;
  char *fname = NULL;
  bool recursive_check = false;
  int depth_limit = 1;
  while((c = getopt(argc, argv, "f:gar")) != -1) {
    switch (c) {
    case 'f':
      fname = optarg;
      break;
    case 'r':
      recursive_check = true;
      break;
    default:
      cerr << "Unknown option " << c << endl;
      exit(1);
    }
  }
  cout << endl;
  Problem problem;
  if (fname) {
    problem.readFile(string(fname));
  } else {
    cerr << "Problem not found. " << endl;
    exit(1);
  }
  problem.print();
  cout << endl;
  string goalName("Bucharest");
  string startName("Arad");
  Queue fringe;
  vector < Node > closed;
  Node * nodeptr = (Node::factory(problem.indices[startName]));
  fringe.Insert(nodeptr);
  bool success = false;
  while (!success) {
    if (fringe.empty())
      break;
    sort(fringe.begin(), fringe.end(), less_eval_function);
    nodeptr = fringe.RemoveFirst();
    cout << "considering"
	 << problem.nodes[nodeptr->state].first
	 << " (" << nodeptr->evalValue << ")" << endl;

    int i = nodeptr->state;
    if (problem.nodes[i].first == goalName) {
      success = true;
      break;
    }

    if (recursive_check == false || find(closed.begin(), closed.end(), *nodeptr) == closed.end()) {
      closed.push_back(*nodeptr);

      for (int j = 0; j < problem.nSuccessors(i); j++) {
	int eval;
	eval = nodeptr->pathCost + problem.weights[i][j] + problem.nodes[problem.successors[i][j]].second;

	Node *nextnode = Node::factory(problem.successors[i][j], nodeptr, problem.weights[i][j], eval);
	cout << "    "
	     << problem.nodes[problem.successors[i][j]].first
	     << " from "
	     << problem.nodes[i].first
	     << " (g:" << nodeptr->pathCost + problem.weights[i][j] << ", "
	     << " h:" << problem.nodes[problem.successors[i][j]].second << ", "
	     << " f:" << eval << ")" <<endl;
	fringe.Insert(nextnode);
      }
    }
  }

  if (!success) {
    cout << "Failure!" << endl;
  } else {
    cout << endl << "Solution: " << endl;
    while (problem.nodes[nodeptr->state].first != startName) {
      cout << problem.nodes[nodeptr->state].first
	   << "(depth " << nodeptr->depth
	   << ", cost " << nodeptr->pathCost
	   << ", eval " << nodeptr->evalValue << ")" << endl;
      nodeptr = (nodeptr->parent());
    }
    cout << startName << "(depth " << nodeptr->depth << ")" << endl;
  }
  Node::freeall();
  cout << endl << Node::all.size() << " Nodes left" << endl;
  cout << endl << Node::count << " Nodes created" << endl;
}
