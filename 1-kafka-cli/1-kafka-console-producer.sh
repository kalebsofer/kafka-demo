# Replace "kafka-console-producer" 
# by "kafka-console-producer" or "kafka-console-producer.bat" based on your system # (or bin/kafka-console-producer or bin\windows\kafka-console-producer.bat if you didn't setup PATH / Environment variables)

kafka-console-producer 

############################
### CONDUKTOR PLATFORM #####
############################ 


kafka-topics --command-config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --topic first_topic --create --partitions 1

# producing
kafka-console-producer --producer.config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --topic first_topic
>Hello World
>My name is Conduktor
>I love Kafka
>^C  (<- Ctrl + C is used to exit the producer)


# producing with properties
# specify every message should be acknoledged (acks) by  all brokers
kafka-console-producer --producer.config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --topic first_topic --producer-property acks=all
> some message that is acked
> just for fun
> fun learning!


# producing to a non existing topic
kafka-console-producer --producer.config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --topic new_topic
> hello world!

# if topic auto creation is disabled (by default on playground), then the topic will not appear in the list
kafka-topics --command-config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --list

# overall, please create topics with the appropriate number of partitions before producing to them!


# produce with keys
kafka-console-producer --producer.config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --topic first_topic --property parse.key=true --property key.separator=:
>example key:example value
>name:Stephane



############################
#####     LOCALHOST    #####
############################

kafka-topics --bootstrap-server localhost:9092 --topic first_topic --create --partitions 1

# producing
kafka-console-producer --bootstrap-server localhost:9092 --topic first_topic 
> Hello World
>My name is Conduktor
>I love Kafka
>^C  (<- Ctrl + C is used to exit the producer)


# producing with properties
kafka-console-producer --bootstrap-server localhost:9092 --topic first_topic --producer-property acks=all
> some message that is acked
> just for fun
> fun learning!


# producing to a non existing topic
kafka-console-producer --bootstrap-server localhost:9092 --topic new_topic
> hello world!

# our new topic only has 1 partition
kafka-topics --bootstrap-server localhost:9092 --list
kafka-topics --bootstrap-server localhost:9092 --topic new_topic --describe


# edit config/server.properties or config/kraft/server.properties
# num.partitions=3

# produce against a non existing topic again
kafka-console-producer --bootstrap-server localhost:9092 --topic new_topic_2
hello again!

# this time our topic has 3 partitions
kafka-topics --bootstrap-server localhost:9092 --list
kafka-topics --bootstrap-server localhost:9092 --topic new_topic_2 --describe

# overall, please create topics with the appropriate number of partitions before producing to them!


# produce with keys
kafka-console-producer --bootstrap-server localhost:9092 --topic first_topic --property parse.key=true --property key.separator=:
>example key:example value
>name:Stephane