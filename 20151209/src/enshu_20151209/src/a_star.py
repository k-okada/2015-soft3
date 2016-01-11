#!/usr/bin/env/ python

import sys
import copy

class a_star_puzzle:
    def __init__(self):
        step = 0
        self.ans = self.import_puzzle('./ans.dat') 
        state = self.import_puzzle('./puzzle.dat')
        self.solve(state,step)

    def import_puzzle(self,filepath):
        f = open(filepath)
        data = f.readlines()
        state = []
        for line in data:
            x = []
            for i in line.split(' '):
                x.append(int(i))
            state.append(x)
        return state

    def solve(self,state,step):
        value = self.value(state,step)
        print "Step: " + str(step) 
        print "Value: " + str(value)
        print state
        diff = self.difference(state)
        if diff == 0:
            print "Total Step: " + str(step)
            sys.exit(0)
        step += 1
        [x_zero,y_zero] = self.zero_pos(state)
        zero_next = []
        for i in range(-1,2):
            for j in range(-1,2):
                if (i != 0 or j != 0) and (abs(i) + abs(j)  ==1):
                    if x_zero+i < 3 and x_zero+i > -1 and y_zero+j < 3 and y_zero+j > -1:
                        zero_next.append(state[x_zero+i][y_zero+j])
        for x in zero_next:
            state_ = self.replace(state,x)
            if value >= self.value(state_,step):
                self.solve(state_,step)

    def difference(self,state):
        diff = 0
        for (line_state, line_ans) in zip(state,self.ans):
            for (x_state, x_ans) in zip(line_state,line_ans):
                if x_state != x_ans and x_state != 0:
                    diff += 1
        return diff
    
    def zero_pos(self,state):
        for i in range(0,len(state)):
            for j in range(0,len(state[i])):
                if state[i][j] == 0:
                    pos = [i,j]
        return pos

    def replace(self,state,x):
        returnlist = []
        for line in state:
            x_= []
            for i in line:
                if i == 0:
                    x_.append(x)
                elif i == x:
                    x_.append(0)
                else:
                    x_.append(i)
            returnlist.append(x_)
        return returnlist

    def value(self,state,step):
        return step + self.difference(state)

if __name__ =='__main__':
    a_star = a_star_puzzle()

