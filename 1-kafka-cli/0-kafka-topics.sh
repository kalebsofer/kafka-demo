############################
### UPSTASH PLATFORM #####
############################ 

# cluster: https://console.upstash.com/kafka/8e1f36e4-9bd8-44af-877e-d8843339d820?tab=details
# start zookeeper:
# /opt/homebrew/bin/zookeeper-server-start /opt/homebrew/etc/zookeeper/zoo.cfg

# start kafka:
# Open another Terminal window and run the following command from the root of Apache Kafka to start Apache Kafka.
# /opt/homebrew/bin/kafka-server-start /opt/homebrew/etc/kafka/server.properties

# Ensure to keep both terminal windows opened, otherwise you will shut down Kafka or Zookeeper.
# Remember to end session when done 



# Create your playground.config file
# with content such as 
security.protocol=SASL_SSL
sasl.jaas.config=org.apache.kafka.common.security.plain.PlainLoginModule required username="<your username>" password="<your password>";
sasl.mechanism=PLAIN

# Start running commands
kafka-topics 

kafka-topics --command-config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092

kafka-topics --command-config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --create --topic first_topic

kafka-topics --command-config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --create --topic second_topic --partitions 5

# this will create a topic with an RF of 3 (behaviour of using Conduktor Platform - all topics have the same RF of 3)
#  RF: necessary for disaster recovery for example
# will fail on local host (can't ave higher rf than number of brokers)

kafka-topics --command-config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --create --topic third_topic --replication-factor 2

# list topics
kafka-topics --command-config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --list

# describe topics
kafka-topics --command-config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --topic first_topic --describe

# delete topics
kafka-topics --command-config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --topic second_topic --delete



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
