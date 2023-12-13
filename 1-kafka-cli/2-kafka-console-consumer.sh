# Replace "kafka-console-consumer" 
# by "kafka-console-consumer" or "kafka-console-consumer.bat" based on your system # (or bin/kafka-console-consumer or bin\windows\kafka-console-consumer.bat if you didn't setup PATH / Environment variables)

kafka-console-consumer 

############################
### CONDUKTOR PLATFORM #####
############################ 

# create a topic with 3 partitions
kafka-topics --command-config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --topic second_topic --create --partitions 3

# consuming
kafka-console-consumer --consumer.config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --topic second_topic

# other terminal
# round robin partitioner class, we produce to one partition at a time
# only necessary for demo, not in prod
kafka-console-producer --producer.config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic second_topic

# consuming from beginning
kafka-console-consumer --consumer.config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --topic second_topic --from-beginning

# display key, values and timestamp in consumer
kafka-console-consumer --consumer.config playground.config --bootstrap-server crucial-elephant-12008-eu1-kafka.upstash.io:9092 --topic second_topic --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --property print.partition=true --from-beginning



############################
#####     LOCALHOST    #####
############################

# create a topic with 3 partitions
kafka-topics --bootstrap-server localhost:9092 --topic second_topic --create --partitions 3

# consuming
kafka-console-consumer --bootstrap-server localhost:9092 --topic second_topic

# other terminal
kafka-console-producer --bootstrap-server localhost:9092 --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic second_topic

# consuming from beginning
kafka-console-consumer --bootstrap-server localhost:9092 --topic second_topic --from-beginning

# display key, values and timestamp in consumer
kafka-console-consumer --bootstrap-server localhost:9092 --topic second_topic --formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --property print.partition=true --from-beginning