#include <iostream>
#include <vector>
#include <array>
#include <memory>
#include <algorithm>

namespace {
    const std::array<int, 9> goal = {1, 2, 3, 4, 5, 6, 7, 8, 0};
    const std::array<int, 9> cannot_solve = {1, 2, 3, 4, 5, 6, 8, 7, 0};
};

class Node {
private:
    int h;
    std::array<int, 9> state;
    Node* parent_node;
    std::vector<std::shared_ptr<Node> > child_node;
public:
    Node(int h, std::array<int, 9> state, Node* parent_node) {
        this->h = h;
        this->state = state;
        this->parent_node = parent_node;
    }

    void expandChildNode() {
        //stateから移動可能なマス目を見つける
        int zero_index = 0;
        std::vector<std::array<int, 9> > can_move;
        for (int i = 0; i < 9; i++) {
            if (state.at(i) == 0) {
                zero_index = i;
            }
        }
        //up
        if (!(0 <= zero_index  && zero_index <= 2)) {
            std::array<int, 9> tmp = this->state;
            std::swap(tmp.at(zero_index), tmp.at(zero_index - 3));
            can_move.push_back(tmp);
        }
        //down
        if (!(6 <= zero_index && zero_index <= 8)) {
            std::array<int, 9> tmp = this->state;
            std::swap(tmp.at(zero_index), tmp.at(zero_index + 3));
            can_move.push_back(tmp);
        }
        //right
        if (!(zero_index == 2 || zero_index == 5 || zero_index == 8)) {
            std::array<int, 9> tmp = this->state;
            std::swap(tmp.at(zero_index), tmp.at(zero_index + 1));
            can_move.push_back(tmp);
        }
        //left
        if (!(zero_index == 0 || zero_index == 3 || zero_index == 6)) {
            std::array<int, 9> tmp = this->state;
            std::swap(tmp.at(zero_index), tmp.at(zero_index - 1));
            can_move.push_back(tmp);
        }
        for (int i = 0; i < can_move.size(); i++) {
            std::shared_ptr<Node> tmp(new Node(this->h + 1, can_move.at(i), this)); 
            child_node.push_back(tmp);
        }
    }
   
    Node* getParentNode() {
        return parent_node;
    }

    std::vector<std::shared_ptr<Node> > getChildNode() {
        return child_node;
    }
    
    int getEval() {
        //各数字のゴール時の場所とのマンハッタン距離の総和をヒューリスティック関数とする
        int eval = 0;
        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                if (state.at(i) == goal.at(j)) {
                    int state_x = i % 3;
                    int state_y = i / 3;
                    int goal_x = j % 3;
                    int goal_y = j / 3;
                    eval += std::abs(state_x - goal_x) + std::abs(state_y - goal_y);
                }
            }
        }
        return eval + h;
    } 

    bool is_finish() {
        int eval = 0;
        for (int i = 0; i < 9; i++) {
            if (state.at(i) != goal.at(i)) {
                ++eval;
            }
        }
        return (eval == 0);
    }

    std::array<int, 9> getState() {
        return state;
    }

};

int main()
{
    std::cout << "input init state ex. 1 2 3 4 5 6 7 8 0" << std::endl;
    std::array<int, 9> start_state;
    std::cin >> start_state.at(0) >>  start_state.at(1) >> start_state.at(2) >> start_state.at(3) >> start_state.at(4) >> start_state.at(5) >> start_state.at(6) >> start_state.at(7) >> start_state.at(8); 
    {
        std::array<int, 9> tmp = start_state;
        std::sort(tmp.begin(), tmp.end());
        const std::array<int, 9> legal_pattern = {0, 1, 2, 3, 4, 5, 6, 7, 8};
        if (tmp != legal_pattern) {
            std::cout << "Illegal pattern!" << std::endl;
            return 0;
        }
    }
    Node root_node(0, start_state, nullptr);
    Node* tmp_node = &root_node;
    std::vector<Node*> all_node;
    all_node.push_back(&root_node);
    std::vector<std::array<int, 9> > search_log;
    bool is_finish = false;

    if (root_node.is_finish()) {
        is_finish = true;
        search_log.push_back(root_node.getState());
    }
    if (root_node.getState() == cannot_solve) {
        std::cout << "Can't solve!" << std::endl;
        return 0;
    }
    while (!is_finish) {
        //次のノードを展開
        tmp_node->expandChildNode();
        
        //子ノードを登録 && 終了状態のものがあれば探索を終了
        //すでに探索しているノードは展開しない。
        for (int i = 0; i < tmp_node->getChildNode().size(); i++) {
            bool double_flag = false;
            std::array<int, 9> tmp_state = tmp_node->getChildNode().at(i)->getState();
            if (tmp_state == cannot_solve) {
                std::cout << "Can't solve!" << std::endl;
                return 0;
            }
            for (int j = 0; j < all_node.size(); j++) {
                if (all_node.at(j)->getState() == tmp_state) {
                    double_flag = true;
                    if (all_node.at(j)->getEval() > tmp_node->getChildNode().at(i)->getEval()) {
                        all_node.at(j) = tmp_node->getChildNode().at(i).get();
                    }
                }
            }
            if (double_flag != true) {
                all_node.push_back(tmp_node->getChildNode().at(i).get());
            }
            if (tmp_node->getChildNode().at(i)->is_finish() && (!is_finish)) {
                is_finish = true;
                tmp_node = tmp_node->getChildNode().at(i).get();
                while (tmp_node != nullptr) {
                    search_log.push_back(tmp_node->getState());
                    tmp_node = tmp_node->getParentNode();
                }
                break;
            }
        }

        //終了でなかったので、一番評価値が小さく子ノードを持たないノードをtmp_nodeとして処理を継続
        int eval_min_index = 0;
        int eval_min = 10000;
        for (int i = 0; i < all_node.size(); i++) {
            if (all_node.at(i)->getChildNode().size() == 0) { //子ノードがない
                if (all_node.at(i)->getEval() < eval_min) {
                    eval_min = all_node.at(i)->getEval();
                    eval_min_index = i;
                }
            }
        }
        tmp_node = all_node.at(eval_min_index);
    }
    for (int i = 0; i < search_log.size(); i++) {
        for (int j = 0; j < 9; j++) {
            const int num = search_log.at(search_log.size() - 1 - i).at(j); 
            if (num != 0) {
                std::cout << num << " ";
            } else {
                std::cout << " " << " ";
            }
            if (j % 3 == 2) std::cout << std::endl;
        }
        std::cout << std::endl;
    }
    return 0;
}
