# -*- coding:utf-8 -*-
from random import *
import math

class Panel:
    def __init__(self,num,x,y):
        self.num = num
        self.x = x
        self.y = y

    def setX(self,x):
        self.x = x

    def setY(self,y):
        self.y = y

    def exchange(self,panel):
        tmp_x = panel.getX()
        tmp_y = panel.getY()
        panel.setX(self.getX())
        panel.setY(self.getY())
        self.setX(tmp_x)
        self.setY(tmp_y)

    def getNum(self):
        return self.num

    def getX(self):
        return self.x

    def getY(self):
        return self.y


def make_puzzle():
    panel_lst = []
    coordinate_lst = [(0,1),(0,2),(1,0),(1,1),(1,2),(2,0),(2,1),(2,2),(0,0)]
    for i in range(9):
        coordinate = coordinate_lst.pop(randint(0,len(coordinate_lst)-1))
        panel_lst.append(Panel(i,coordinate[0],coordinate[1]))
    return panel_lst

def calc_h(panel_lst):
    sum_x = 0
    sum_y = 0
    for i in panel_lst:
        if i.getNum() == 1:
           sum_x += math.fabs(i.getX()-0)
           sum_y += math.fabs(i.getY()-0)
        elif i.getNum() == 2:
           sum_x += math.fabs(i.getX()-0)
           sum_y += math.fabs(i.getY()-1)
        elif i.getNum() == 3:
           sum_x += math.fabs(i.getX()-0)
           sum_y += math.fabs(i.getY()-2)
        elif i.getNum() == 4:
           sum_x += math.fabs(i.getX()-1)
           sum_y += math.fabs(i.getY()-0)
        elif i.getNum() == 5:
           sum_x += math.fabs(i.getX()-1)
           sum_y += math.fabs(i.getY()-1)
        elif i.getNum() == 6:
           sum_x += math.fabs(i.getX()-1)
           sum_y += math.fabs(i.getY()-2)
        elif i.getNum() == 7:
           sum_x += math.fabs(i.getX()-2)
           sum_y += math.fabs(i.getY()-0)
        elif i.getNum() == 8:
           sum_x += math.fabs(i.getX()-2)
           sum_y += math.fabs(i.getY()-1)
    return sum_x + sum_y

def slide_panel(parent):
    children = []
    k = len(parent[3])-1
    #up
    if parent[0][0].getY() != 0:
        tmp = copy(parent[0])
        for i in tmp:
            if i.getX() == tmp[0].getX():
                if i.getY() == tmp[0].getY() -1:
                    i.exchange(tmp[0])
                    break
        mani = list(parent[3])
        mani.append(0);
        children.append([tmp,parent[1]+1,calc_h(tmp),mani])
    #right
    if parent[0][0].getX() != 2:
        tmp = copy(parent[0])
        for i in tmp:
            if i.getX() == tmp[0].getX() + 1:
                if i.getY() == tmp[0].getY():
                    i.exchange(tmp[0])
                    break
        mani = list(parent[3])
        mani.append(1)
        children.append([tmp,parent[1]+1,calc_h(tmp),mani])
    #down
    if parent[0][0].getY() != 2:
        tmp = copy(parent[0])
        for i in tmp:
            if i.getX() == tmp[0].getX():
                if i.getY() == tmp[0].getY() + 1:
                    i.exchange(tmp[0])
                    break
        mani = list(parent[3])
        mani.append(2)
        children.append([tmp,parent[1]+1,calc_h(tmp),mani])
    #left
    if parent[0][0].getX() != 0:
        tmp = copy(parent[0])
        for i in tmp:
            if i.getX() == tmp[0].getX() - 1:
                if i.getY() == tmp[0].getY():
                    i.exchange(tmp[0])
                    break
        mani = list(parent[3])
        mani.append(3)
        children.append([tmp,parent[1]+1,calc_h(tmp),mani])
    return children

def copy(panel_lst):
    result = []
    for i in panel_lst:
        result.append(Panel(i.getNum(),i.getX(),i.getY()))
    return result

def make_closed(parent,children,closed):
    tmp = []
    memo = []
    result = []

    panel_lst = parent[0]
    panel = [[-1,-1,-1],[-1,-1,-1],[-1,-1,-1]]
    for i in panel_lst:
        panel[i.getX()][i.getY()] = i.getNum()
    closed.append(panel)

    for i in children:
        panel = [[-1,-1,-1],[-1,-1,-1],[-1,-1,-1]]
        for j in i[0]:
            panel[j.getX()][j.getY()] = j.getNum()
        tmp.append(panel)

    for i in range(len(tmp)):
        for j in closed:
            if tmp[i] == j:
                memo.append(i)
                break
    memo = sorted(memo,reverse = True)
    for i in memo:
        children.pop(i)
        

def answer(parent,init):
    tmp = copy(init)
    for k in parent[3]:
        #up
        if k == 0:
            for i in tmp:
                if i.getX() == tmp[0].getX():
                    if i.getY() == tmp[0].getY() -1:
                        i.exchange(tmp[0])
                        show([tmp,parent[1],parent[2],parent[3]])
                        break
        #right
        elif k == 1:
            for i in tmp:
                if i.getX() == tmp[0].getX() + 1:
                    if i.getY() == tmp[0].getY():
                        i.exchange(tmp[0])
                        show([tmp,parent[1],parent[2],parent[3]])
                        break
        #down
        elif k == 2:
            for i in tmp:
                if i.getX() == tmp[0].getX():
                    if i.getY() == tmp[0].getY() + 1:
                        i.exchange(tmp[0])
                        show([tmp,parent[1],parent[2],parent[3]])
                        break
        #left
        elif k == 3:
            for i in tmp:
                if i.getX() == tmp[0].getX() - 1:
                    if i.getY() == tmp[0].getY():
                        i.exchange(tmp[0])
                        show([tmp,parent[1],parent[2],parent[3]])
                        break
                    
def show(parent_head):
    panel_lst = parent_head[0]
    panel = [[-1,-1,-1],[-1,-1,-1],[-1,-1,-1]]
    for i in panel_lst:
        panel[i.getX()][i.getY()] = i.getNum()
    #print 'g: '+str(parent_head[1])
    #print 'h: '+str(parent_head[2])
    #print 'f: '+str(parent_head[1] + parent_head[2])
    for i in range(3):
        for j in range(3):
            print panel[i][j],
        print ''
    print '----------'

if __name__ == '__main__':
    node_lst = []
    closed = []

    puzzle_init = [Panel(0,2,1),Panel(6,0,1),Panel(1,0,2),Panel(3,1,0),Panel(5,1,1),Panel(4,1,2),Panel(2,2,0),Panel(8,0,0),Panel(7,2,2)]
    manipulate = [-1]
    node_lst.append([puzzle_init,0,calc_h(puzzle_init),manipulate])
    show(node_lst[0])

    while 1:
        parent = node_lst.pop(0)
        if parent[2] == 0:
            break
        children = slide_panel(parent)

        make_closed(parent,children,closed)

        node_lst += children
        node_lst = sorted(node_lst, key = lambda x: x[1]+x[2])

    answer(parent,puzzle_init)
