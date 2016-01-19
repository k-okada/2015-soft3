def CalcManhattanScoreCoords(coord1, coord2):
    return abs(coord1[0] - coord2[0]) + abs(coord1[1] - coord2[1])

class Board(object):
    width = 3
    height = 3
    max_index = width * height
    goal_coords = (None, (0, 0), (1, 0), (2, 0), (2, 1), (2, 2), (1, 2), (0, 2), (0, 1))
    all_coords = set()
    for i in range(width):
        for j in range(height):
            all_coords.add((i, j))
    
    center_coord = (1, 1)
    right_successor = {}
    for i in range(1, max_index):
        right_successor[goal_coords[i]] = goal_coords[i+1 if i+1 < max_index else 1]
    
    @classmethod
    def GetRightSuccessor(klass, coord):
        return klass.right_successor[coord]

    @classmethod
    def GetNextIndex(klass, index):
        return index+1 if index+1 < klass.max_index else 1

    def __init__(self, coords):
        if not isinstance(coords, tuple) or len(coords) != self.max_index:
            raise ValueError
        if coords[0] is not None or len(self.all_coords.difference(coords)) != 1:
            raise ValueError
        self.coords = coords
        self.g_star = 0
        self.f_star = None

    def GetCoords(self):
        return self.coords

    def SetGStar(self, g_star):
        self.g_star = g_star

    def GetGStar(self):
        return self.g_star

    def IsGoal(self):
        return self.coords == self.goal_coords

    def CalcManhattanScoreOne(self, to_calc):
        if not (to_calc > 0 and to_calc < self.max_index):
            raise ValueError
        return CalcManhattanScoreCoords(self.goal_coords[to_calc], self.coords[to_calc])

    def CalcManhattanScore(self):
        ret = 0
        for i in range(1, self.max_index):
            ret += self.CalcManhattanScoreOne(i)
        return ret

    def CalcSequenceScore(self):
        ret = 0
        for i in range(1, self.max_index):
            if self.coords[i] == self.center_coord:
                ret += 1
            elif self.coords[self.GetNextIndex(i)] != self.GetRightSuccessor(self.coords[i]):
                ret += 2
        return ret

    def GetHStar(self):
        return self.CalcManhattanScore() + 3 * self.CalcSequenceScore()

    def GetFStar(self):
        if self.f_star is None:
            self.f_star = self.GetGStar() + self.GetHStar()
        return self.f_star
        
    def MoveGenerator(self):
         diff_set = set(self.all_coords).difference(self.coords)
         if len(diff_set) != 1:
             raise ValueError

         empty_coord = list(diff_set)[0]
         for i in range(1, self.max_index):
             if CalcManhattanScoreCoords(empty_coord, self.coords[i]) == 1:
                 new_coords = list(self.coords)
                 new_coords[i] = empty_coord
                 yield Board(tuple(new_coords))


def AStar(state):
    state.SetGStar(0)
    open = {}
    open[state.GetCoords()] = (state, state.GetFStar())
    closed = {}
    
    class FoundResult(Exception):
        pass

    try:
        while len(open):
            (state, score) = sorted(open.iteritems(), key=lambda x: x[1][1])[0][1]
            state_key = state.GetCoords()
            del open[state_key]
            closed[state_key] = (state, state.GetFStar())
            for new_state in state.MoveGenerator():
                new_state.SetGStar(state.GetGStar() + 1)
                if new_state.IsGoal():
                    raise FoundResult

                new_state_key = new_state.GetCoords()
                f_star = new_state.GetFStar()
                if new_state_key in closed:
                    if f_star >= closed[new_state_key][1]:
                        continue
                    else:
                        del closed[new_state_key]

                open[new_state_key] = (new_state, f_star)

    except FoundResult:
        print "Found (%d steps)." % new_state.GetFStar()

    else:
        print "Not found."


def main():
    start_state = Board((None, (1, 0), (0, 2), (2, 0), (1, 1), (2, 1), (2, 2), (1, 2), (0, 0)))
    AStar(start_state)


if __name__ == '__main__':
    main()
