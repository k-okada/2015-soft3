#coding: utf-8
##　以下のurlを参考にしました。
##  http://www.geocities.jp/m_hiroi/light/pyalgo28.html
##  http://www.geocities.jp/m_hiroi/light/pyalgo27.html

import heapq
import random
OPEN=1
CLOSE=0

adjacent = (
    (1, 3),       # 0
    (0, 2, 4),    # 1
    (1, 5),       # 2
    (0, 4, 6),    # 3
    (1, 3, 5, 7), # 4
    (2, 4, 8),    # 5
    (3, 7),       # 6
    (4, 6, 8),    # 7
    (5, 7)        # 8
)

# 距離
distance = (
    (),
    (0, 1, 2, 1, 2, 3, 2, 3, 4),
    (1, 0, 1, 2, 1, 2, 3, 2, 3),
    (2, 1, 0, 3, 2, 1, 4, 3, 2),
    (1, 2, 3, 0, 1, 2, 1, 2, 3),
    (2, 1, 2, 1, 0, 1, 2, 1, 2),
    (3, 2, 1, 2, 1, 0, 3, 2, 1),
    (2, 3, 4, 1, 2, 3, 0, 1, 2),
    (3, 2, 3, 2, 1, 2, 1, 0, 1)
)


# ゴールの局面
GOAL = [1, 2, 3, 4, 5, 6, 7, 8, 0]



def print_answer(x):
    if x is not None:
        print_answer(x.prev)
        print x.state, x.cost
    

#goalまでのmanhattan 距離の和
def h_manhattan(state):
    v = 0
    for x in xrange(9):
        p = state[x]
        if p == 0: continue
        v += distance[p][x]
        return v

class State:
    def __init__(self, state, space, prev, move, kind = OPEN):
        self.state = state
        self.space = space
        self.prev = prev
        self.move = move
        if prev is None:
            self.cost = move + h_manhattan(state)
        else:
            p = state[prev.space]
            self.cost = prev.cost + 1 - distance[p][space] + distance[p][prev.space]
        
        self.kind = kind
        
    def __cmp__(x, y):
        return x.cost - y.cost

def A_star(start):
    q = []
    heapq.heapify(q)
    
    a = State(start, start.index(0), None, 0)
    heapq.heappush(q, a)
    
    table = {}
    table[tuple(start)] = a
    
    while not q == []:
        a = heapq.heappop(q)
        if a.kind == CLOSE: continue
        for x in adjacent[a.space]:
            b = a.state[:]
            b[a.space] = b[x]
            b[x] = 0
            key = tuple(b)
            #同じ局面があるかどうかの判定
            if key in table:
                c = table[key]
                #同じ局面なら手数で比較
                if c.move > a.move + 1:
                    #いい手がみつかった場合元のデータを消して見つかったものを子として追加.ない場合は元のデータを子にする.
                    if c.kind == OPEN:
                        c.kind = CLOSE
                        c = State(b, x, a, a.move + 1)
                        table[key] = c
                    else:
                        c.prev = a
                        c.cost = c.cost - c.move + a.move + 1
                        c.move = a.move + 1
                        c.kind = OPEN
                    heapq.heappush(q, c)
            else:
                #print "add c"
                #print b
                c = State(b, x, a, a.move + 1)
                if b == GOAL:
                    print_answer(c)
                    return
                heapq.heappush(q, c)
                table[key] = c
        
        a.kind = CLOSE

if __name__ == '__main__':
    # 盤面
    board = [8, 6, 7, 2, 5, 4, 3, 0, 1]
    random.shuffle(board)
    A_star(board)

