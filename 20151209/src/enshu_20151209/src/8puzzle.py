#!/usr/bin/env python
#coding: utf-8

import random
import math
import copy
from heapq import heappush, heappop

class Eight_puzzle:
    state = []
    size = 3
    def __init__(self):
        self.state = []
        for y in range(1,self.size+1):
            state_temp = [x for x in range((y-1)*self.size+1 , y*self.size+1)]
            self.state.append(state_temp)
        self.state[self.size-1][self.size-1] = 0
        #シャッフル
        for i in range(100):
            rand = random.randint(0,3)
            if(rand == 0) : self.up()
            if(rand == 1) : self.down()
            if(rand == 2) : self.right()
            if(rand == 3) : self.left()
        self.start_state_x = [0 for i in range(self.size**2)]
        self.start_state_y = [0 for i in range(self.size**2)]
        self.history = []
        self.history.append(copy.deepcopy(self.state))
        for x in range(self.size):
            for y in range(self.size):
                self.start_state_x[self.state[y][x]] = x
                self.start_state_y[self.state[y][x]] = y
        self.step = 0
        return
    def move(self,direction):
        if(direction == 0) : result = self.up()
        if(direction == 1) : result = self.down()
        if(direction == 2) : result = self.right()
        if(direction == 3) : result = self.left()
        if result == 0:
            self.history.append(copy.deepcopy(self.state))
            self.step = self.step + 1
        return result
    def up(self):
        for y_list in self.state:
            if(0 in y_list):
                x = y_list.index(0)
                y = self.state.index(y_list)
                break
        if(y <= 0):
            #print "上に移動はできません"
            return 1
        self.state[y][x], self.state[y-1][x] = self.state[y-1][x], self.state[y][x]
        return 0
    def down(self):
        for y_list in self.state:
            if(0 in y_list):
                x = y_list.index(0)
                y = self.state.index(y_list)
                break
        if(y >= self.size-1):
            #print "下に移動はできません"
            return 1
        self.state[y][x], self.state[y+1][x] = self.state[y+1][x], self.state[y][x]
        return 0
    def left(self):
        for y_list in self.state:
            if(0 in y_list):
                x = y_list.index(0)
                y = self.state.index(y_list)
                break
        if(x <= 0):
            #print "左に移動はできません"
            return 1
        self.state[y][x], self.state[y][x-1] = self.state[y][x-1], self.state[y][x]
        return 0
    def right(self):
        for y_list in self.state:
            if(0 in y_list):
                x = y_list.index(0)
                y = self.state.index(y_list)
                break
        if(x >= self.size-1):
            #print "右に移動はできません"
            return 1
        self.state[y][x], self.state[y][x+1] = self.state[y][x+1], self.state[y][x]
        return 0
    #ヒューリスティクス関数（正解からのマンハッタン距離）
    def calc_h(self):
        self.h = 0
        for y in range(self.size):
            for x in range(self.size):
                val = self.state[y][x]
                if val == 0 :
                    val_correct_x = self.size-1
                    val_correct_y = self.size-1
                else:
                    val_correct_x = (val-1)%self.size
                    val_correct_y = int(math.ceil(val*1.0/self.size)-1)
                self.h = self.h + abs(val_correct_x - x) + abs(val_correct_y - y)
        return self.h
    def calc_g(self):
        self.g = 0
        now_state_x = [0 for i in range(self.size**2)]
        now_state_y = [0 for i in range(self.size**2)]
        for x in range(self.size):
            for y in range(self.size):
                now_state_x[self.state[y][x]] = x
                now_state_y[self.state[y][x]] = y
        for i in range(self.size**2):
            self.g = self.g + abs(self.start_state_x[i] - now_state_x[i]) + abs(self.start_state_y[i] - now_state_y[i])
        return self.g
    def print_state(self):
        for i in range(self.size):
            print self.state[i]
        print ""
def main():
    puzzle = Eight_puzzle()
    Astar_search(puzzle)
    return

def Astar_search(puzzle):
    search_queue = []
    #優先度付きキューに格納
    heappush(search_queue, (puzzle.calc_h() - 0,puzzle))
    for i in range(100000):
        search_puzzle = heappop(search_queue)[1]
        #上下左右探索
        for direction in range(4):
            puzzle_tmp = copy.deepcopy(search_puzzle)
            result = puzzle_tmp.move(direction)
            if result == 0:
                #移動成功したらステップ数+hの優先度で格納
                heappush(search_queue, (puzzle_tmp.calc_h()+puzzle_tmp.step,puzzle_tmp))
                #print puzzle_tmp.history
                #もしゴールに到達(h=0)したら抜ける
                if puzzle_tmp.calc_h() == 0:
                    print puzzle_tmp.step
                    hist = puzzle_tmp.history
                    for i in hist:
                        for j in range(puzzle_tmp.size):
                            print i[j]
                        print
                    return 0
