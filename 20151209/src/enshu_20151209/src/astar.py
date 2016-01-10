##############################
# missionaries and cannibals # 
##############################

open_list=[]
closed_list=[]
total_node=0

class Node():
    def __init__(self,index,parent,state,g):
        self.index=index
        self.parent=parent
        # state = [m(west),c(west),m(east),c(east),ship]
        # ship = 0(west) or 1(east)
        self.state=state
        self.g=g
    def printnode(self):
        if self.state[4]==0:
            pos="west"
        else:
            pos="east"
        # h = the number of people on the west shore
        # not monotone but admissive
        h=self.state[0]+self.state[1]
        f=self.g+h
        print "Node%2d : {} %s / g=%2d, h=%2d, f=%2d"\
            .format(self.state[0:4])%(self.index,pos,self.g,h,f)

def expand(node):
    global open_list,total_node
    mw=node.state[0]
    cw=node.state[1]
    me=node.state[2]
    ce=node.state[3]
    if node.state[4]==0: # on the west shore
        if (mw-2>=cw or mw-2==0) and me+2>=ce:
            if check([mw-2,cw,me+2,ce,1]):
                open_list.append(Node(total_node,node,[mw-2,cw,me+2,ce,1],node.g+1))
                total_node+=1
                open_list[len(open_list)-1].printnode()
        if (mw-1>=cw or mw-1==0) and me+1>=ce:
            if check([mw-1,cw,me+1,ce,1]):
                open_list.append(Node(total_node,node,[mw-1,cw,me+1,ce,1],node.g+1))
                total_node+=1
                open_list[len(open_list)-1].printnode()
        if cw>=2 and (me>=ce+2 or me==0):
            if check([mw,cw-2,me,ce+2,1]):
                open_list.append(Node(total_node,node,[mw,cw-2,me,ce+2,1],node.g+1))
                total_node+=1
                open_list[len(open_list)-1].printnode()
        if cw>=1 and (me>=ce+1 or me==0):
            if check([mw,cw-1,me,ce+1,1]):
                open_list.append(Node(total_node,node,[mw,cw-1,me,ce+1,1],node.g+1))
                total_node+=1
                open_list[len(open_list)-1].printnode()
        if mw>=1 and cw>=1 and me>=ce:
            if check([mw-1,cw-1,me+1,ce+1,1]):
                open_list.append(Node(total_node,node,[mw-1,cw-1,me+1,ce+1,1],node.g+1))
                total_node+=1
                open_list[len(open_list)-1].printnode()
    else:
        if (me-2>=ce or me-2==0) and mw+2>=cw:
            if check([mw+2,cw,me-2,ce,0]):
                open_list.append(Node(total_node,node,[mw+2,cw,me-2,ce,0],node.g+1))
                total_node+=1
                open_list[len(open_list)-1].printnode()
        if (me-1>=ce or me-1==0) and mw+1>=cw:
            if check([mw+1,cw,me-1,ce,0]):
                open_list.append(Node(total_node,node,[mw+1,cw,me-1,ce,0],node.g+1))
                total_node+=1
                open_list[len(open_list)-1].printnode()
        if ce>=2 and (mw>=cw+2 or mw==0):
            if check([mw,cw+2,me,ce-2,0]):
                open_list.append(Node(total_node,node,[mw,cw+2,me,ce-2,0],node.g+1))
                total_node+=1
                open_list[len(open_list)-1].printnode()
        if ce>=1 and (mw>=cw+1 or mw==0):
            if check([mw,cw+1,me,ce-1,0]):
                open_list.append(Node(total_node,node,[mw,cw+1,me,ce-1,0],node.g+1))
                total_node+=1
                open_list[len(open_list)-1].printnode()
        if me>=1 and ce>=1 and mw>=cw:
            if check([mw+1,cw+1,me-1,ce-1,0]):
                open_list.append(Node(total_node,node,[mw+1,cw+1,me-1,ce-1,0],node.g+1))
                total_node+=1
                open_list[len(open_list)-1].printnode()
    open_list.sort(key=lambda node: (node.state[0]+node.state[1]+node.g))

def check(state):
    global open_list,closed_list,total_node
    flag=1
    for node in open_list:
        if node.state==state:
            flag=0
            break
    for node in closed_list:
        if node.state==state:
            flag=0
            break
    return flag

def search():
    global open_list,closed_list,total_node
    open_list.append(Node(0,None,[3,3,0,0,0],0))
    total_node+=1
    print "start from here"
    open_list[0].printnode()
    while open_list!=[]:
        nextnode=open_list.pop(0)
        print "----------------------------------------"
        nextnode.printnode()
        print "--->"
        if nextnode.state==[0,0,3,3,1]: # goal
            print "answer found!!!!!"
            break
        closed_list.append(nextnode)
        expand(nextnode)
    answer_list=[]
    while nextnode.parent!=None:
        answer_list.append(nextnode)
        nextnode=nextnode.parent
    answer_list.append(closed_list[0])
    answer_list.reverse()
    for node in answer_list:
        node.printnode()

if __name__=="__main__":
    search()
