/* A star search */
#include <stdio.h>
#include <stdlib.h>

int count = 1;

struct BOARD {
  char cell[16];
  char pushed[16]; //not pushed: 0, pushed: 1
  struct BOARD *next;
  struct BOARD *back;
  int depth,f;
};

struct BOARD B0 = {
  {1,0,0,1,0,1,1,0,0,1,1,0,1,0,0,1},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},NULL,NULL,0,0
};

struct BOARD BG = {
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
};

struct BOARD *q0 = NULL, *q2 = &B0;

struct BOARD *getq() {
  struct BOARD *q; 
  if (q2==NULL) return NULL;
  q = q2;
  q2 = q2->next;
  return (q);
}

int nc = 0;
int ns = 0;

#define FN1 "Init.dat"
#define FN2 "Goal.dat"

main(){
  struct BOARD *b;
  struct BOARD *q1;

  B0.depth = 1;

  printf("Initial state is \n",ns);
  printboard(&B0);
  printf("Goal state is \n",ns);
  printboard(&BG);
  printf("Execution begins..\n");

    
  f_value(&B0);

  while ((q1 = getq()) != NULL) {
    expand(q1);
    if (q0==NULL) q0 = q1;
    else {
      q1 -> next = q0;
      q0 = q1;
    }
  }
}

int diff(b1,b2) //周囲のnマスが押された時に色が変わるとしたら (5-n)/5 が ans に加わるようになっている
     struct BOARD *b1,*b2; {
  int k;
  double ans=0;
  for (k=0;k<16;k++) {
    if(b1->cell[k] != b2->cell[k]){
      ans += 1;
      // if(k%4>0) ans -= 1/5;
      // if(k%4<3) ans -= 1/5;
      // if(k>3) ans -= 1/5;
      // if(k<12) ans -= 1/5;
    }
  }
  ans = (int)(ans);
  return(ans);
}


f_value(b)
struct BOARD *b; {
  b->f = b->depth + diff(b,&BG);
}

push(b,i)
struct BOARD *b; int i; {
  struct BOARD *m;
  int k;
  m=(struct BOARD*)malloc (sizeof(struct BOARD));
  if (m==NULL) {
    printf("memory overflow\n");
    exit(2);
  }
  for (k=0;k<16;k++) m-> cell[k] = b->cell[k];
  for (k=0;k<16;k++) m-> pushed[k] = b->pushed[k];

  m -> cell[i] = swap(b -> cell[i]);
  if (i%4>0) m -> cell[i-1] = swap(b -> cell[i-1]);; //左
  if (i>3) m -> cell[i-4] = swap(b -> cell[i-4]); //上
  if (i%4<3) m -> cell[i+1] = swap(b -> cell[i+1]); //右
  if (i<12) m -> cell[i+4] = swap(b -> cell[i+4]);;   //下
  m -> pushed[i] = 1;

  m-> back = b;
  m-> next = NULL;
  m-> depth = b -> depth + 1;    

  if (equal(m,&BG)) { 
    bornprint(m);
    printf("**** Answer found... ****\n");
    traceback(m); 
    printf("No. of children is %d\n",nc);
    printf("Length of solution is %d\n",ns);
    exit(0); 
  }

  putq(m);
}

int swap(int i) {
  return i = (i + 1) % 2;
}

expand(b)
struct BOARD *b; {
  register int i;
  for (i=0; i<16; i++)
    if (b->pushed[i]==0) push(b, i);
}

equal(b1,b2)
struct BOARD *b1,*b2; {
  register int i;
  for (i=0; i<16; i++) 
    if (b1->cell[i]!=b2->cell[i]) return 0;
  return 1;
}

traceback(b)
struct BOARD *b; {
  for (; b!=NULL; b=b->back) {
    ns++;
    printboard(b);
  }
}

printboard(b)
struct BOARD *b; {
  int i;
  for (i=0;i<16;i++) {
    if (b->cell[i]==0) putchar('X');
    else printf("%1d",b->cell[i]);
    if (i%4==3) {
      putchar('\n');
      if (i!=15) {
  putchar('-');
  putchar('+');
  putchar('-');
  putchar('+');
  putchar('-');
  putchar('+');
  putchar('-');
  putchar('\n');
      }
    }
    else putchar('|');
  }
  putchar('\n');
}


printQ(b)
struct BOARD *b; {
  if (b==NULL) return 0;
  printboard(b);
  printf(" %d ==> \n",b->f);
  printQ(b->next);
}


bornprint(b)
struct BOARD *b; {
  nc++;
  printboard(b->back);
  printf(" %d ----> %d \n",b->back->f,b->f);
  printboard(b);
  printf("\n");
  printf("%d\n", count);
  count ++;
}

int putq(b)
     struct BOARD *b; {
  struct BOARD *n,*oldn=NULL; 
  for (n=q0; n!=NULL; n=n->next)
    if (equal(b,n)) {free(b); return 0; }
  if (q2==NULL) {
    f_value(b);
    q2=b;
    bornprint(b);
  }
  else {
    f_value(b);
    for (n=q2; n->next!=NULL; n=n->next)
      if (equal(b,n)) {free(b); return 0; }
    for (n=q2; n!=NULL; oldn=n, n=n->next)
      if (n->f > b->f) break;
    b -> next = n;
    if (oldn != NULL) oldn->next = b;
    else q2 = b;
    bornprint(b);
  }
}
