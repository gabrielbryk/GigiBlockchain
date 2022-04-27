#include <zmq.hpp>
#include <string>
#include <iostream>
#include "hash.hpp"
#include "Block.hpp"
#include "common.hpp"
#include <iostream>
#include <fstream>
#include "BlockChain.hpp"
#include "Peer.hpp"
#include <unistd.h>
#include "message.pb.h"

//#include "requests.hpp"

#include "json.hh"
using json = nlohmann::json;

using namespace std;



blockchain::Message handleMessage(blockchain::Message msg,BlockChain bc){
    blockchain::Message reply;
    switch (msg)
    {
    case blockchain::Message::HEARTBEAT:
        reply.set_type(blockchain::Message::REPLY)
        break;
    
    default:
        reply.set_type(blockchain::Message::ERROR)
        break;
    }
    return reply
}



void runServer(zmq::context_t context, Blockchain bc){
    //  Prepare our context and socket
    zmq::context_t context (1);
    zmq::socket_t socket (context, ZMQ_REP);
    socket.bind ("tcp://*:5555");
    

    while (true) {
        zmq::message_t request;
        //  Wait for next request from client
        socket.recv (&request);
        std::cout << "Received" << std::endl;
        blockchain::Message message;
        std::string msg_str(static_cast<char*>(request.data()), request.size());
        message.ParseFromString(msg_str);
        std::string text_str;
        google::protobuf::TextFormat::PrintToString(message, &text_str);
        std::cout << text_str << std::endl;
        
        std::string reply_str;
        handleMessage(message, bc).SerializeToString(&msg_str);
        zmq::message_t reply (msg_str.size());
        memcpy ((void *) reply.data (), msg_str.c_str(), msg_str.size());
        std::cout << "Sending reply ..." << std::endl;
        socket.send (reply);
    }
}

Blockchain getLargestChain(vector<Peer> peers){
    Blockchain bc = new BlockChain(0);
    if(peers.empty()){
        return bc; 
    }
    for(Peer p : peers){
        json chain = peer.getChain();
        if (chain["length"].get<int>() > bc.getNumOfBlocks()){
            bc.replaceChain(chain);
        }
    }
    return bc;
}

void gossipSelf(vector<Peer> peers, string address){
    for(Peer peer : peers){
        json chain = peer.addNode(address);
    }
}
void sendNewChain(vector<Peer> peers, string json){
    printf("Sending new chain to network....\n");
    for (Peer peer : peers){
        printf("--- sending to peer %d\n",peer.getAddress());
        peer.newChain(json);
    }
}

int main (int argc, char *argv[]) {
    GOOGLE_PROTOBUF_VERIFY_VERSION;

    vector<Peer> peers;
    srand (time(NULL));
    string line;
    ifstream myfile ("peers.txt");
    if (myfile.is_open())
    {
        while ( getline (myfile,line) )
        {
            listOfNodes.insert(Peer(line,NULL));
        }
        myfile.close();
    }

    BlockChain bc = getLargestChain(peers);

    char host[256];
    gethostname(host, sizeof(host));
    gossipSelf(peers, host);

    while(true){
        vector<string> v;
        v.push_back("Message");
        // mine for the has
        auto pair = findHash(bc.getNumOfBlocks(),bc.getLatestBlockHash(),v);
        // add the block to the blockchain
        bc.addBlock(bc.getNumOfBlocks(),bc.getLatestBlockHash(),pair.first,pair.second,v );
        // send the blockchain to the network
        sendNewChain(peers,bc.toJSON());

        sleep(rand() % 10 + 1);
    }

    google::protobuf::ShutdownProtobufLibrary();
    return 0;
}
