/*---------------------------------------------
 *
 * A Tree Search kit for experimenting with graph
 * formulated or network problems such as the 
 * Romanian road network problem as described in 
 * Russell and Norvig, Chapter 3.
 *
 * Last Modified:  28.7.04, KAH
 *
 * $Id: graphsearch.cpp,v 1.1 2010-01-22 03:35:47 k-okada Exp $
 *---------------------------------------------*/

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
  // previous or parent node instance in the search tree
  Node *parentptr;
  // not yet used - could be used as child index
  int action;
  //depth in the tree  root is 1
  int depth;
  // same as  depth at present
  int pathCost;

  int evalValue;
  // normal constructor
  Node(int s, Node * p, int cost, int eval) {
    state = s;
    parentptr = p;
    if (parentptr == NULL) {
      depth = 1;
      pathCost = 0;
      evalValue = 0;
    } else {
      depth = parentptr->depth + 1;
      pathCost = parentptr->pathCost +cost;
      evalValue = eval;
    }
  }
  ~Node() {
  }				// destructor
  Node(const Node & node) {	// copy constructor
    state = node.state;
    parentptr = node.parentptr;
    depth = node.depth;
  }
  Node * parent() {
    // return a pointer to this instance's parent instance
    if (parentptr != NULL)
      return parentptr;
	
    else
      return this;
  }
  // count of all instances created by factory
  static int count;		
  // all factory-created instances
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
  
  // free up memory  from all factory-created instances
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
// internal list of all factory-created instances
vector < Node * >Node::all;
typedef pair<string, int> node;

/*------------------------------------------------*/ 
// Suitable for a graph like proble such as 
// the Romanian road network problem such as
// in Russell and Norvig, 2nd Edition, Chapter 3.
class Problem {
  // map of string-names to integer indices  i=map[string]
 public:map < string, int >indices;
 // names of the vertices (cities)        string=names[i]
 vector < node > nodes;
 // k=successors[i][j] is jth successor of ith vertex
 vector < vector < int > > successors;
 // w=weights[i][j] is jth weight of arc to ith vertex
 vector < vector < int > > weights;

 // number of vertices (cities) in the graph (roadnetwork)
 int n() {
   return nodes.size();
 }
 int nSuccessors(int i) {
   return successors[i].size();
 }			// out-degree of ith vertex
 Problem() {
 }			// constructor
 ~Problem() {
 }			// destructor
 void addSuccessor(string src, string dst, int w) {
   successors[indices[src]].push_back(indices[dst]);
   weights[indices[src]].push_back(w);
 }

  void addSuccessorPair(string a, string b, int w) {
   addSuccessor(a, b, w);
   addSuccessor(b, a, w);
 }
 
 void readFile(string filename) {
   // currently wired with test data
	
   // first pass to get city names only:
   ifstream in(filename.c_str());
   assert(in);
   nodes.clear();
   char line[1024];
   while (in.getline(line, sizeof(line), '\n')) {
     // ignore  comment lines in the file
     if (line[0] != '#') {
       cout << line << endl;
       // whitespace possible delimiters
       char *delimiters = " \t\n";
       int wordcount = 0;
       char *wordptr1, *wordptr2;
       // tokenize string
       wordptr1 = strtok(line, delimiters);
       string source(wordptr1);
       wordptr2 = strtok(NULL, delimiters);
       string heuristic(wordptr2);
       cerr << ">> " << source << "/" << heuristic << endl;
       addNode(source, atoi(heuristic.c_str()));	// add if it exists
     }
   }
   in.close();
   for (int i = 0; i < nodes.size(); i++) {
     indices[nodes[i].first] = i;
   } vector < int >dummy;	// an empty vector<int> 
   // sets up 1st dimension  with n() copies of dummy
   successors.assign(n(), dummy);
   // sets up 1st dimension  with n() copies of dummy
   weights.assign(n(), dummy);
	
   // second pass to get arcs:
   ifstream in2(filename.c_str());
   assert(in2);
   while (in2.getline(line, sizeof(line), '\n')) {
     // ignore  comment lines in the file
     if (line[0] != '#') {	
       // whitespace possible delimiters
       char *delimiters = " \t\n";
       int wordcount = 0;
       char *wordptr1, *wordptr2;
       // tokenize string
       wordptr1 = strtok(line, delimiters);
       string source(wordptr1);
       wordptr2 = strtok(NULL, delimiters);
       string heuristic(wordptr2);
       // should already exist
       assert(nodeExists(node(source,atoi(heuristic.c_str()))));
       while (((wordptr1 = strtok(NULL, delimiters)) != NULL) &&
              ((wordptr2 = strtok(NULL, delimiters)) != NULL)) {
         wordcount++;
         string destination(wordptr1);
         string stepcost(wordptr2);
         // should already exist
         addSuccessor(source, destination, atoi(stepcost.c_str()));
       }
     }
   }
   in2.close();
 }
 bool nodeExists(node nod) {	
   // does a name alredy exist in vocabulary of names?
   for (vector < node >::iterator it = nodes.begin();
       it != nodes.end(); it++) {
     if (nod == *it)
       return true;
   }
   return false;
 }
 void addNode(string name, int value) {	// add name to names only if it is
   // not already in vocabulary
   if (!nodeExists(node(name, value))) {
     nodes.push_back(node(name, value));
   }
 }
 void testProblem() {
   addNode(string("Arad"), 366); // get all the city names on first pass
   addNode(string("Zerend"), 374);
   addNode(string("Oradea"), 380);
   addNode(string("Sibiu"), 253);
   addNode(string("Fagaras"), 176);
   addNode(string("Rimnicu-Vilcea"), 193);
   addNode(string("Pitesti"), 100);
   addNode(string("Craiova"), 160);
   addNode(string("Bucharest"), 0);
   for (int i = 0; i < nodes.size(); i++) {

     indices[nodes[i].first] = i;
   }
   vector < int >dummy;	// an empty vector<int> 
   
// sets up 1st dimension  with n() copies of dummy
   successors.assign(n(), dummy);
   // sets up 1st dimension  with n() copies of dummy
   weights.assign(n(), dummy);

   // uniform  (unity)  for the weights
   addSuccessor(string("Arad"), string("Zerend"), 75);
   addSuccessor(string("Arad"), string("Sibiu"), 140);
   addSuccessor(string("Zerend"), string("Arad"), 75);
   addSuccessor(string("Zerend"), string("Oradea"), 71);
   addSuccessor(string("Oradea"), string("Zerend"), 71);
   addSuccessor(string("Oradea"), string("Sibiu"), 151);
   addSuccessor(string("Sibiu"), string("Arad"), 140);
   addSuccessor(string("Sibiu"), string("Oradea"), 151);
   addSuccessor(string("Sibiu"), string("Fagaras"), 99);
   addSuccessor(string("Sibiu"), string("Rimnicu-Vilcea"), 80);
   addSuccessor(string("Rimnicu-Vilcea"), string("Sibiu"), 80);
   addSuccessor(string("Rimnicu-Vilcea"), string("Pitesti"), 97);
   addSuccessor(string("Rimnicu-Vilcea"), string("Craiova"), 146);
   addSuccessor(string("Pitesti"), string("Rimnicu-Vilcea"), 97);
   addSuccessor(string("Pitesti"), string("Bucharest"), 101);
   addSuccessor(string("Pitesti"), string("Craiova"), 138);
   addSuccessor(string("Craiova"), string("Rimnicu-Vilcea"), 146);
   addSuccessor(string("Craiova"), string("Pitesti"), 138);
   addSuccessor(string("Fagaras"), string("Sibiu"), 99);
   addSuccessor(string("Fagaras"), string("Bucharest"), 211);
   addSuccessor(string("Bucharest"), string("Pitesti"), 101);
   addSuccessor(string("Bucharest"), string("Fagaras"), 211);
 } 
 // printout problem graph for check purposes - writes out each
 // vertex, its out-degree, and its list of successor vertices.
 void print() {
   int bmax = 0;
   for (int i = 0; i < n(); i++) {
     cout << nodes[i].first << " <" << nodes[i].second << "> (" << nSuccessors(i) << "):: ";
     bmax = bmax > nSuccessors(i) ? bmax : nSuccessors(i);
     for (int j = 0; j < nSuccessors(i); j++) {
       cout << nodes[successors[i][j]].first << "(" << weights[i][j] << "),";
     } cout << endl;
   } cout << "Max breadth b " << bmax << endl;
 }
};


/*------------------------------------------------*/
class Queue:public deque < Node * > {
				// a LIFO Queue
public:Node * First() {
  return front();
}
  void Insert(Node * n) {
    return push_front(n);
  }
  Node * RemoveFirst() {
    Node * r = First();
    pop_front();
    return r;
  }
};

bool less_eval_function(const Node *n1, const Node *n2){
  return (n1->evalValue < n2->evalValue);
}
/*------------------------------------------------*/
int main(int argc, char *argv[])
{
  int c;
  char *fname = NULL;
  enum { GS, AS } search_algorithm = AS;
  bool recursive_check = false;
  int depth_limit = 1;
  while ((c = getopt(argc, argv, "f:gar")) != -1) {
    switch (c) {
    case 'f':
      fname = optarg;
      break;
    case 'g':
      search_algorithm = GS;
      break;
    case 'a':
      search_algorithm = AS;
      break;
    case 'r':
      recursive_check = true;
      break;
    default:
      cerr << "Unknown option " << c << endl;
      exit(1);
    }
  }
  cout << ";; Selecting ";
  switch (search_algorithm) {
  case GS:
    cout << "Greedy best-first Search " << depth_limit;
    break;
  case AS:
    cout << "A star Search";
    break;
  }
  cout << endl << endl;;
  Problem problem;
  if (fname) {
    problem.readFile(string(fname));
  } else {
    problem.testProblem();
  }
  problem.print();
  cout << endl;
  string goalName("Bucharest");
  string startName("Arad");
  Queue fringe;
  vector < Node > closed;
  Node * nodeptr =
    (Node::factory(problem.indices[startName]));
  fringe.Insert(nodeptr);
  bool success = false;
  while (!success) {
    if (fringe.empty())
      break;		// IF-EMPTY -> FAILURE
    sort(fringe.begin(), fringe.end(), less_eval_function);
    nodeptr = fringe.RemoveFirst();	// REMOVE-FIRST
    cout << "considering "
         << problem.nodes[nodeptr->state].first
         << " (" << nodeptr->evalValue << ")" << endl;
	
    // GOAL-TEST
    int i = nodeptr->state;
    if (problem.nodes[i].first == goalName) {
      success = true;
      break;
    }

    // state is not in cloased
    if (recursive_check == false
        || find(closed.begin(), closed.end(),
          *nodeptr) == closed.end()) {
      closed.push_back(*nodeptr);

      for (int j = 0; j < problem.nSuccessors(i); j++) {	// EXPAND
        int eval;
        switch (search_algorithm) {
          case GS:
            eval = problem.nodes[problem.successors[i][j]].second;
            break;
          case AS:
            eval = nodeptr->pathCost + problem.weights[i][j] + problem.nodes[problem.successors[i][j]].second;
            break;
        }

        Node *nextnode =
          Node::factory(problem.successors[i][j],
                        nodeptr,
                        problem.weights[i][j],
                        eval);
        // diagnostics
        cout << "    " 
             << problem.nodes[problem.successors[i][j]].first
             << " from "
             << problem.nodes[i].first
             << " (g:" << nodeptr->pathCost + problem.weights[i][j] << ", "
             << " h:" << problem.nodes[problem.successors[i][j]].second << ","
             << " f:" << eval << ")" <<endl;
        fringe.Insert(nextnode);
      } 
    }
  }

  // report on the solution path found by back tracing parent pointers
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
  Node::freeall();		// free up space
  cout << endl << Node::all.size() << " Nodes left" << endl;
  cout << endl << Node::count << " Nodes created" << endl;
}


/*------------------------------------------------
  Development Notes:
 
  The C++ STL queue with pop and front implements
   a FIFO queue.  This gives a BFS tree search.

  The C++ Stack is a LIFO  - use  top and pop.

  Both implement  push  which  pushes  onto end of the Queue.

  @KAH 2004--------------------------------------*/ 
    
