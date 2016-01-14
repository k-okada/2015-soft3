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
#define slide(x, v, i, j)       \
    {                           \
        x |= (ull)(v) << 4 * i; \
        x &= ~(15ULL << 4 * j); \
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
    return -sum;
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

    unordered_map<ull, int> scores;
    unordered_map<ull, pair<int, ull>> seq;
    vector<pair<ull, int>> q(bw);
    q.emplace_back(a, f0);
    seq[a] = {-1, -1};
    while (true) {
        priority_queue<tuple<int, ull, int>> nq;
        for (auto& p : q) {
            auto b = p.first;
            int i = p.second;
            for (int j : neighbor[i]) {
                int t = get(b, j);
                slide(b, t, i, j);
                if (seq.count(b) == 0) {
                    int score = calcscore(b);
                    nq.emplace(score, b, j);
                    seq[b] = {t, p.first};
                }
                b = p.first;
            }
        }
        int N = min<int>((int)nq.size(), bw);
        for (int i = 0; i < N; ++i) {
            ull b;
            int j;
            tie(ignore, b, j) = nq.top();
            q[i] = make_pair(b, j);
            nq.pop();
        }
        if (q[0].first == answer)
            break;
    }

    vector<int> res;
    ull asr = answer;
    while (seq.count(asr)) {
        auto b = seq[asr].second;
        int x = seq[asr].first;
        if (x == -1)
            break;
        res.push_back(x);
        asr = b;
    }
    reverse(begin(res), end(res));
    for (int v : res)
        printf("%d\n", v);
}
