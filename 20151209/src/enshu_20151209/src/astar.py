# -*- coding: utf-8 -*-
    

class Node():
    start = None
    goal = None
    def __init__(self,board_list):
        self.parent_node = None
        self.board = board_list
        tmp = 0
        for i,boardpos in enumerate(board_list):
            if self.goal[i] != boardpos:
                tmp += 1
            if boardpos == 0:
                self.pos = i
        self.h = tmp
        self.f = 0

class NodeList(list):
    def find(self, n):
        l = [t for t in self if t.board == n.board]
        return l[0] if l != [] else None

    def remove (self, node):
        del self[self.index(node)]

def directions(pos):
     if pos == 0:
         return [1,3]
     if pos == 1:
         return [1,3,-1]
     if pos == 2:
         return [3,-1]
     if pos == 3:
         return [-3,1,3]
     if pos == 4:
         return [-3,1,3,-1]
     if pos == 5:
         return [-3,3,-1]
     if pos == 6:
         return [-3,1]
     if pos == 7:
         return [-3,1,-1]
     if pos == 8:
         return [-3,-1]
   
    

#Node.start = [1,0,4,3,7,2,6,8,5]
Node.start = [3,1,4,0,7,2,6,8,5]
Node.goal = [0,1,2,3,4,5,6,7,8]
Start = Node(Node.start)
Start.f = Start.h
Goal = Node(Node.goal)
openList = NodeList()
closeList = NodeList()

def fprime(n,m):
    g = lambda n, m: n.f - n.h
    h = lambda m: m.h
    return g(n,m) + h(m) + 1


openList.append(Start)

while openList:
    n = min(openList, key = lambda x :x.f)
    openList.remove(n)
    closeList.append(n)
    if n.h == 0:
        break
    for direction in directions(n.pos):
        board = []
        for i, boardnum in enumerate(n.board):
            if i == n.pos:
                board.append(n.board[i+direction])
            elif i == n.pos + direction:
                board.append(n.board[n.pos])
            else:
                board.append(boardnum)
        m = Node(board)
        om = openList.find(m)
        cm = closeList.find(m)
        fp = fprime(n,m)
        om_fp = fprime(n, om) if om else None
        cm_fp = fprime(n, cm) if cm else None
        if om is None and cm is None:
            m.parent_node = n
            m.f = fp
            openList.append(m)
        elif not om is None and om_fp < om.f:
            om.parent_node = n
            om.f = om_fp
        elif not cm is None and cm_fp < cm.f:
            cm.f = cm_fp
            closeList.remove(cm)
            openList.append(cm)

while n:
    print n.board[0:3]
    print n.board[3:6]
    print n.board[6:9]
    print "*-------------------------*"
    n = n.parent_node
