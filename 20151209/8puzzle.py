#!/usr/bin/env python

import copy

class eight_puzzle:
    def __init__(self,puzzle,dest):
        self.puzzle = puzzle
        self.dest = dest
        self.column_size = len(puzzle)
        self.row_size = len(puzzle[0])
        self.x,self.y = self.find(self.puzzle,0)
        self.get(self.puzzle)

    def left(self,puzzle):
        x,y = self.find(puzzle,0)
        if y <= 0:
            return False
        yold = y
        y = y - 1
        new_puzzle = copy.deepcopy(puzzle)
        new_puzzle[x][yold]=new_puzzle[x][y]
        new_puzzle[x][y] = 0
        return new_puzzle

    def right(self,puzzle):
        x,y = self.find(puzzle,0)
        if y >= 2:
            return False
        yold = y
        y = y + 1
        new_puzzle = copy.deepcopy(puzzle)
        new_puzzle[x][yold]=new_puzzle[x][y]
        new_puzzle[x][y] = 0
        return new_puzzle

    def up(self,puzzle):
        x,y = self.find(puzzle,0)
        if x <= 0:
            return False
        xold = x
        x = x - 1
        new_puzzle = copy.deepcopy(puzzle)
        new_puzzle[xold][y]=new_puzzle[x][y]
        new_puzzle[x][y] = 0
        return new_puzzle

    def down(self,puzzle):
        x,y = self.find(puzzle,0)
        if x >= 2:
            return False
        xold = x
        x = x + 1
        new_puzzle = copy.deepcopy(puzzle)
        new_puzzle[xold][y]=new_puzzle[x][y]
        new_puzzle[x][y] = 0
        return new_puzzle

    def find(self,table,x):
        for column in range(0,self.column_size):
            for row in range(0,self.row_size):
                if table[column][row] == x:
                    return column, row
        return False,False

    def get(self,table):
        for column in range(0,self.column_size):
            a = []
            for row in range(0,self.row_size):
                a.append(table[column][row])
            print a
        print "\n"


class A(eight_puzzle):

    def check(self,table):
        if table == self.dest:
            return True
        else :
            return False

    def estimation(self,table,pre_g):
        i = 0
        for column in range(0,self.column_size):
            for row in range(0,self.row_size):
                if not table[column][row] == self.dest[column][row]:
                    i += 1
        return pre_g + 1 , pre_g + 1 + i

    def search(self):
        OL = [[self.puzzle,self.estimation(self.puzzle,-1)]]
        Solution = []
        CL = []
        while (not OL == []):
            first = OL.pop(0)
            N = first[0]
            pre_g = first[1][0]
            if not (N in CL):
                self.get(N)
                if self.check(N):
                    print "success!!!"
                    self.get(N)
                    return 
                OL = self.QueueFunc(N,OL,pre_g)
                CL.append(N)
        return False

    def QueueFunc(self,N,OL,pre_g):
        res_up = self.up(N)
        res_down = self.down(N)
        res_right = self.right(N)
        res_left = self.left(N)
        if not res_up == False :
            OL.append([res_up,self.estimation(res_up,pre_g)])
        if not res_down == False :
            OL.append([res_down,self.estimation(res_down,pre_g)])
        if not res_right == False :
            OL.append([res_right,self.estimation(res_right,pre_g)])
        if not res_left == False :
            OL.append([res_left,self.estimation(res_left,pre_g)])
        OL.sort(key=lambda x: x[1][1])
        return OL

if __name__ == "__main__":
    puzzle = [[4,3,2],[0,7,8],[6,1,5]]
    dest = [[4,3,0],[6,7,2],[1,5,8]]
    table = A(puzzle,dest)
    table.search()
