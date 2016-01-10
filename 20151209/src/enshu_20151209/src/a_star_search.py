# encoding: utf-8
# solve 8puzzle

from heapq import heappush, heappop

class Node():
    def __init__(self,state,parent,operator,depth,path_cost):
        self.state = state
        self.parent = parent
        self.operator = operator
        self.depth = depth
        self.path_cost = path_cost    #startからこのノードまでのコスト
        self.hashvalue = hash(tuple(self.state))

    def info(self):
        print self.state, self.parent, self.operator, self.depth, self.path_cost

    def __hash__(self):
        return self.hashvalue

    def __eq__(self,other):
        return self.state == other.state

class PuzzleState(Node):
    def __init__(self,state_array,parent,operator,depth,path_cost):
        Node.__init__(self,state_array,parent,operator,depth,path_cost)
        #ここからgoalまでの予想コスト
        self.heuristic = h(self.state)
        #全体のコスト
        self.total_cost = path_cost + self.heuristic

    def info(self):
        Node.info()


def astar():
    open_list = []
    path_costs = {}
    visited = {}

    start = PuzzleState(start_array, None, None, 0, 0)
    goal = PuzzleState(goal_array, None, None, 99, 99)

    heappush(open_list,(start.total_cost, start))

    times = 0

    while len(open_list) > 0:
        times += 1

        current = heappop(open_list)
        current_node = current[1]

        #goalに到達でループを抜ける
        if current_node.state == goal.state:
            goal = current_node
            break

        #空のマスの位置
        index = current_node.state.index(0)
        x, y = calc_XY(index)
        nextXYs = next_XYs(x,y)

        #ノードを展開
        for next_XY in nextXYs:
            next_index = next_XY[0] * board_size + next_XY[1]
            next_board = current_node.state[:]
            next_board[index], next_board[next_index] = next_board[next_index], next_board[index]
            new_node = PuzzleState(next_board,current_node,None,current_node.depth+1,current_node.path_cost+1)
            if tuple(new_node.state) not in visited or \
                    new_node.path_cost < path_costs[new_node]:
                path_costs[new_node] = new_node.path_cost
                visited[tuple(new_node.state)] = new_node
                heappush(open_list, (new_node.total_cost, new_node))

    #探索終了後、経路の導出
    var = goal
    sol = []
    while var != start:
        sol = sol + [var.state]
        var = var.parent
    sol = sol + [var.state]
    sol.reverse()
    return sol, times


#manhatan距離を求める
def h(state_array):
    manhattan = 0
    for i in state_array:
        goal_index = goal_array.index(i)
        goal_x, goal_y = calc_XY(goal_index)
        x, y = calc_XY(state_array.index(i))
        manhattan += abs(x - goal_x) + abs(y - goal_y)
    return manhattan

#空のマスをスライド可能なx,y座標を求める
def next_XYs(x,y):
    next_XYs = [[x,y]]

    if(x+1 < board_size):
        next_XYs.append([x+1,y])
    if(x-1 >= 0):
        next_XYs.append([x-1,y])
    if(y+1 < board_size):
        next_XYs.append([x,y+1])
    if(y-1 >= 0):
        next_XYs.append([x,y-1])

    return next_XYs

#arrayの添字からx,y座標への変換
def calc_XY(index):
    x = index % board_size
    y = index / board_size
    return x,y

def main():
    global start_array, goal_array, board_size
    board_size = 3
    start_array = [2,3,4,1,5,7,6,8,0]
    goal_array = [1,2,3,4,5,6,7,8,0]
    sol, visit = astar()
    return sol, visit
    

if __name__ == "__main__":
    sol, visit = main()
    for s in sol:
        print s
    print len(sol), visit
