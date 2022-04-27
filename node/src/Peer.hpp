#include <iostream>
#include <string>
#include <vector>
#include <memory>
#include <stdexcept>
#include "BlockChain.hpp"
#include "message.pb.h"


using namespace std;
using json = nlohmann::json;

class Peer {
    public:
        Peer(zmq::context_t context, string address);
        void addNode(string address);
        void newChain(json newchain);
        string getAddress();
        json getChain(void);
    private:
        zmq::socket_t socket;
        bool active;
        string address;
        blockchain::Message sendMessage(blockchain::Message message, Peer peer);
};

Peer::Peer(zmq::context_t context, string address){
    socket.connect("tcp://" + address + ":5555");
    blockchain::Message message;
    message->set_type(blockchain::Message::HEARTBEAT);
    if(sendMessage(message) == NULL){
        active = false;
    }
    else{
        active = true;
    }
}
string Peer::getAddress(){
    return address;
}

void Peer::addNode(string address){
    blockchain::Message message;
    message->set_type(blockchain::Message::ADDNODE);
    message->set_data(address);
    sendMessage(message);
}

void Peer::newChain(json newchain){
    lockchain::Message message;
    message->set_type(blockchain::Message::NEWCHAIN);
    message->set_data(newchain);
    sendMessage(message);
}

json Peer::getChain(void){
    blockchain::Message message;
    message->set_type(blockchain::Message::GETCHAIN);
    message = sendMessage(message);
    return json::parse(message.get_data(););  

}
Message Peer::sendMessage(blockchain::Message message){
    std::string request_str;
    message.SerializeToString(&request_str);
    zmq::message_t request (request_str.size());
    memcpy ((void *) request.data (), request_str.c_str(), msg_str.request_str());
    socket.send (reply);

    zmq::message_t reply;
    socket.recv (&reply);
    std::string reply_str(static_cast<char*>(request.data()), request.size());
}