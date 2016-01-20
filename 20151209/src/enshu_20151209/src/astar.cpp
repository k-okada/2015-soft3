#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <queue>
#include <cmath>
#include <random>

#define PARA 10

#define SIZE PARA * 2 + 1

class Block {
public:
	int type;
	int state;
	Block* parent;
	int eval_val;

	Block() {
		type = -1;
		state = -1;
		parent = NULL;
		eval_val = SIZE * SIZE;
	}

	void backtrack(void)
	{
		if (this->type == 2) return;
		if (this->type != 3) this->type = 4;
		this->parent->backtrack();
	}
};

struct Point {
	int x;
	int y;
};

Block field[SIZE][SIZE];
struct Point startp;
struct Point goalp;

bool success = false;
bool operator< (const struct Point &point1, const struct Point &point2)
{
	return field[point1.y][point1.x].eval_val < field[point2.y][point2.x].eval_val;
}

bool operator> (const struct Point &point1, const struct Point &point2)
{
	return field[point1.y][point1.x].eval_val > field[point2.y][point2.x].eval_val;
}

void print_field(void)
{
	for (int y = 0; y < SIZE; y++) {
		for (int x = 0; x < SIZE; x++) {
			if (field[y][x].type == 2) {
				std::cout << "S";
			} else if (field[y][x].type == 3) {
				std::cout << "G";
			} else if (field[y][x].type == 4) {
				std::cout << ".";
			} else if (field[y][x].type == 0) {
				std::cout << " ";
			} else {
				std::cout << "#";
			}
		}
		std::cout << std::endl;
	}
}

int heuristic(struct Point to)
{
	return std::abs(goalp.y - to.y) + std::abs(goalp.x - to.x);
}

int eval_func(struct Point from, struct Point to)
{
	return field[from.y][from.x].eval_val + std::abs(from.y - to.y) + std::abs(from.x - to.x) + heuristic(to);
}

void astar(void)
{
	std::priority_queue<struct Point, std::vector<struct Point>, std::greater<struct Point> > pqOpen;
	pqOpen.push(startp);
	field[startp.y][startp.x].state = 1;

	while (!pqOpen.empty()) {
		struct Point p = pqOpen.top();
		pqOpen.pop();
		field[p.y][p.x].state = 0;
		if (field[p.y][p.x].type == 3) {
			field[p.y][p.x].backtrack();
			success = true;
			break;
		}
		for (int i = 0; i < 4; i++) {
			struct Point pp;
			pp.y = -1;
			pp.x = -1;
			switch (i) {
				case 0:
				if (p.y > 0) {
					pp.y = p.y - 1;
					pp.x = p.x;
				}
				break;
				case 1:
				if (p.y < SIZE - 1) {
					pp.y = p.y + 1;
					pp.x = p.x;
				}
				break;
				case 2:
				if (p.x > 0) {
					pp.y = p.y;
					pp.x = p.x - 1;
				}
				break;
				case 3:
				if (p.x < SIZE - 1) {
					pp.y = p.y;
					pp.x = p.x + 1;
				}
				break;
				default:
				break;
			}
			if (pp.x == -1 || pp.y == -1) continue;
			Block& child = field[pp.y][pp.x];
			if (child.type == 1) continue;
			if (child.state == -1) {
				child.eval_val = eval_func(p, pp);
				child.state = 1;
				child.parent = &(field[p.y][p.x]);
				pqOpen.push(pp);
			} else if (child.state == 0) {
				if (child.eval_val > eval_func(p, pp)) {
					child.eval_val = eval_func(p, pp);
					child.state = 1;
					child.parent = &(field[p.y][p.x]);
					pqOpen.push(pp);
				}
			} else if (child.state == 1) {
				if (child.eval_val > eval_func(p, pp)) {
					child.eval_val = eval_func(p, pp);
					child.parent = &(field[p.y][p.x]);
				}
			}
		}
	}

	if (!success) {
		std::cout << "Failed." << std::endl;
		return;
	}

	print_field();
}

void generate_maze(void)
{
	int maze[SIZE][SIZE];

	for (int y = 0; y < SIZE; y++) {
		for (int x = 0; x < SIZE; x++) {
			maze[y][x] = 1;
		}
	}
	std::random_device rnd;
	int a = (rnd()%PARA) * 2 + 1;
	int b = (rnd()%PARA) * 2 + 1;
	maze[a][b] = 0;
	while (1) {
		int count = 0;
		for (int y = 0; y < PARA; y++) {
			for (int x = 0; x < PARA; x++) {
				if (maze[2 * y + 1][2 * x + 1] == 1) continue;
				for (int i = 0; i < 4; i++) {
					bool flag = false;
					switch (i) {
						case 0:
						if (2 * y + 1 > 1 && maze[2 * y - 1][2 * x + 1] == 1) flag = true;
						break;
						case 1:
						if (2 * y + 1 < SIZE - 2 && maze[2 * y + 3][2 * x + 1] == 1) flag = true;
						break;
						case 2:
						if (2 * x + 1 > 1 && maze[2 * y + 1][2 * x - 1] == 1) flag = true;
						break;
						case 3:
						if (2 * x + 1 < SIZE - 2 && maze[2 * y + 1][2 * x + 3] == 1) flag = true;
						break;
						default:
						break;
					}
					if (flag) count++;
				}
			}
		}
		if (count == 0) break;
		std::random_device rnd;
		int choice = rnd()%count + 1;
		count = 0;
		int px = -1, py = -1, dir = -1;
		for (int y = 0; y < PARA; y++) {
			for (int x = 0; x < PARA; x++) {
				if (maze[2 * y + 1][2 * x + 1] == 1) continue;
				for (int i = 0; i < 4; i++) {
					bool flag = false;
					switch (i) {
						case 0:
						if (2 * y + 1 > 1 && maze[2 * y - 1][2 * x + 1] == 1) flag = true;
						break;
						case 1:
						if (2 * y + 1 < SIZE - 2 && maze[2 * y + 3][2 * x + 1] == 1) flag = true;
						break;
						case 2:
						if (2 * x + 1 > 1 && maze[2 * y + 1][2 * x - 1] == 1) flag = true;
						break;
						case 3:
						if (2 * x + 1 < SIZE - 2 && maze[2 * y + 1][2 * x + 3] == 1) flag = true;
						break;
						default:
						break;
					}
					if (flag) count++;
					if (choice == count) {
						px = 2 * x + 1;
						py = 2 * y + 1;
						dir = i;
						break;
					}
				}
				if (px != -1) break;
			}
			if (px != -1) break;
		}
		while (1) {
			switch (dir) {
				case 0:
				maze[py - 1][px] = 0;
				maze[py - 2][px] = 0;
				py = py - 2;
				break;
				case 1:
				maze[py + 1][px] = 0;
				maze[py + 2][px] = 0;
				py = py + 2;
				break;
				case 2:
				maze[py][px - 1] = 0;
				maze[py][px - 2] = 0;
				px = px - 2;
				break;
				case 3:
				maze[py][px + 1] = 0;
				maze[py][px + 2] = 0;
				px = px + 2;
				break;
				default:
				break;
			}
			int c = rnd()%4;
			bool flag = false;
			switch (c) {
				case 0:
					if (py > 1 && maze[py - 2][px] == 1) flag = true;
					break;
				case 1:
					if (py < SIZE - 2 && maze[py + 2][px] == 1) flag = true;
					break;
				case 2:
					if (px > 1 && maze[py][px - 2] == 1) flag = true;
					break;
				case 3:
					if (px < SIZE - 2 && maze[py][px + 2] == 1) flag = true;
					break;
				default:
					break;
			}
			if (!flag) break;
			dir = c;
		}
	}
	
	int cnt = 0;
	for (int y = 0; y < SIZE; y++) {
		for (int x = 0; x < SIZE; x++) {
			if (maze[y][x] == 0) cnt++;
		}
	}
	int sp = rnd()%cnt;
	int gp = rnd()%cnt;
	while (sp == gp) gp = rnd()%cnt;
	cnt = 0;
	for (int y = 0; y < SIZE; y++) {
		for (int x = 0; x < SIZE; x++) {
			field[y][x].type = maze[y][x];
			if (maze[y][x] == 0) {
				if (cnt == sp) {
					field[y][x].type = 2;
					startp.y = y;
					startp.x = x;
				}
				if (cnt == gp) {
					field[y][x].type = 3;
					goalp.y = y;
					goalp.x = x;
				}
				cnt++;
			}
		}
	}
}

int main(int argc, char** argv)
{
	if (argc < 2) {
		generate_maze();
	} else {

		std::string filename(argv[1]);
		std::ifstream ifs(filename);

		if (ifs.fail()) {
			std::cout << "File Open Failed." << std::endl;
			return 0;
		}

		std::string str;
		int y = 0;
		while (getline(ifs, str)) {
			for (int x = 0; x < (int)str.length(); x++) {
				if (str[x] == 's') {
					field[y][x].type = 2;
					startp.x = x;
					startp.y = y;
				} else if (str[x] == 'g') {
					field[y][x].type = 3;
					goalp.x = x;
					goalp.y = y;
				} else if (str[x] == '0') {
					field[y][x].type = 0;
				} else if (str[x] == '1') {
					field[y][x].type = 1;
				} else {
					std::cout << "Format Error." << std::endl;
				}
			}
			y++;
		}
	}
	std::cout << "Problem" << std::endl;
	print_field();
	std::cout << std::endl;
	std::cout << "Answer" << std::endl;
	astar();
	
	return 0;
}
