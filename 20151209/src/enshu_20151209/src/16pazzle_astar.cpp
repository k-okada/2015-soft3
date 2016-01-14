#include <bits/stdc++.h>
using namespace std;

typedef unsigned long long ull;
const ull answer = 1147797409030816545ULL;
const int bw = 20000;  //ビーム幅
int ROW[] = {3, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3};
int COL[] = {3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2};
vector<int> neighbor[16] = {
    {4, 1},
    {0, 5, 2},
    {1, 6, 3},
    {2, 7},
    {0, 8, 5},
    {1, 4, 9, 6},
    {2, 5, 10, 7},
    {3, 6, 11},
    {4, 12, 9},
    {5, 8, 13, 10},
    {6, 9, 14, 11},
    {7, 10, 15},
    {8, 13},
    {9, 12, 14},
    {10, 13, 15},
    {11, 14},
};


void decode(array<char, 16>& a, ull val)
{
    for (int i = 0; i < 16; ++i)
        a[i] = (val >> (4 * i)) & 15;
}

#define get(x, i) (int((x) >> 4 * (i)) & 15)
#define slide(x, v, i, j)         \
    {                             \
        x |= (ull)(v) << 4 * (i); \
        x &= ~(15ULL << 4 * (j)); \
    }

int calcscore(const ull& x)
{
    int sum = 0;
    for (int i = 0; i < 16; ++i) {
        int t = get(x, i);
        if (t == 0)
            continue;
        int d = abs(ROW[t] - i / 4) + abs(COL[t] - i % 4);
        sum += d;
    }
    return sum;
}

void input(ull& a, int& k)
{
    a = 0;
    ifstream ifs("data.txt");
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            string s;
            ifs >> s;
            ull tmp;
            if (s == "*") {
                tmp = 0;
                k = i * 4 + j;
            } else {
                tmp = atoi(s.c_str());
            }
            cout << tmp << " ";
            a |= tmp << (4 * (4 * i + j));
        }
        cout << endl;
    }
}

int main()
{
    ull a;
    int f0;
    input(a, f0);
    cout << "#####start######" << endl;

    unordered_map<ull, tuple<int, int, int, ull>> closed;                                                                                  // key : 盤面 -> value : tuple<scoreH, scoreG, 0の位置, parent>
    unordered_map<ull, tuple<int, int, int, ull>> opened;                                                                                  // key : 盤面 -> value : tuple<scoreH, scoreG, 0の位置, parent>
    priority_queue<tuple<int, ull, int, int, ull>, vector<tuple<int, ull, int, int, ull>>, greater<tuple<int, ull, int, int, ull>>> open;  // value : tuple<score, 盤面, nowg, 0の位置, parent>
    open.push(make_tuple(calcscore(a), a, 0, f0, 0));
    opened[a] = make_tuple(calcscore(a) + 0, 0, f0, 0);
    while (!open.empty()) {
        ull now, nownow, parent;
        int nowf, nows, nowg;
        tie(nows, now, nowg, nowf, parent) = open.top();
        nownow = now;
        closed[now] = make_tuple(nows - nowg, nowg, nowf, parent);
        if (get<1>(open.top()) == answer)
            break;
        opened.erase(now);
        open.pop();
        for (int j : neighbor[nowf]) {
            int t = get(now, j);
            slide(now, t, nowf, j);
            int score = calcscore(now);
            if (closed.count(now) == 0) {
                if (opened.count(now) == 0) {
                    open.push(make_tuple(score + nowg + 1, now, nowg + 1, j, nownow));
                    opened[now] = make_tuple(score, nowg + 1, j, nownow);
                } else {
                    auto tmp = opened[now];
                    if (get<0>(tmp) + get<1>(tmp) > score + nowg + 1) {
                        opened[now] = make_tuple(score, nowg + 1, j, nownow);
                    }
                }
            } else {
                auto tmp = closed[now];
                if (get<0>(tmp) + get<1>(tmp) > score + nowg + 1) {
                    closed[now] = make_tuple(score, nowg + 1, j, nownow);
                }
            }
            now = nownow;
        }
    }
    cout << "#####Finished#####" << endl;

    vector<int> res;
    ull asr = answer;
    while (closed.count(asr)) {
        auto x = get<3>(closed[asr]);
        if (x == 0)
            break;
        res.push_back(get<2>(closed[asr]));
        asr = x;
    }
    reverse(begin(res), end(res));
    for (int v : res)
        printf("%d\n", v);
}
