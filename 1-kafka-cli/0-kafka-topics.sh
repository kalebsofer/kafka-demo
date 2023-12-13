############################
### UPSTASH PLATFORM #####
############################ 


kafka-topics 

kafka-topics --command-config playground.config --bootstrap-server <my-boostrap-server>

kafka-topics --command-config playground.config --bootstrap-server <my-boostrap-server> --create --topic first_topic

kafka-topics --command-config playground.config --bootstrap-server <my-boostrap-server> --create --topic second_topic --partitions 5

# this will create a topic with an RF of 3 (behaviour of using Conduktor Platform - all topics have the same RF of 3)
#  RF: necessary for disaster recovery for example
# will fail on local host (can't ave higher rf than number of brokers)

kafka-topics --command-config playground.config --bootstrap-server <my-boostrap-server> --create --topic third_topic --replication-factor 2

# list topics
kafka-topics --command-config playground.config --bootstrap-server <my-boostrap-server> --list

# describe topics
kafka-topics --command-config playground.config --bootstrap-server <my-boostrap-server> --topic first_topic --describe

# delete topics
kafka-topics --command-config playground.config --bootstrap-server <my-boostrap-server> --topic second_topic --delete



############################
#####     LOCALHOST    #####
############################

kafka-topics 

kafka-topics --bootstrap-server localhost:9092 --list 

kafka-topics --bootstrap-server localhost:9092 --topic first_topic --create

kafka-topics --bootstrap-server localhost:9092 --topic second_topic --create --partitions 3

kafka-topics --bootstrap-server localhost:9092 --topic third_topic --create --partitions 3 --replication-factor 2

# Create a topic (working)
kafka-topics --bootstrap-server localhost:9092 --topic third_topic --create --partitions 3 --replication-factor 1

# List topics
kafka-topics --bootstrap-server localhost:9092 --list 

# Describe a topic
kafka-topics --bootstrap-server localhost:9092 --topic first_topic --describe

# Delete a topic 
kafka-topics --bootstrap-server localhost:9092 --topic first_topic --delete
# (only works if delete.topic.enable=true)
