# Replace "kafka-consumer-groups" 
# by "kafka-consumer-groups" or "kafka-consumer-groups.bat" based on your system # (or bin/kafka-consumer-groups or bin\windows\kafka-consumer-groups.bat if you didn't setup PATH / Environment variables)


############################
### CONDUKTOR PLATFORM #####
############################ 

# look at the documentation again
kafka-consumer-groups

# describe the consumer group
kafka-consumer-groups --command-config playground.config --bootstrap-server <my-boostrap-server> --describe --group my-first-application

# Dry Run: reset the offsets to the beginning of each partition
kafka-consumer-groups --command-config playground.config --bootstrap-server <my-boostrap-server> --group my-first-application --reset-offsets --to-earliest --topic third_topic --dry-run

# execute flag is needed
kafka-consumer-groups --command-config playground.config --bootstrap-server <my-boostrap-server> --group my-first-application --reset-offsets --to-earliest --topic third_topic --execute

# describe the consumer group again
kafka-consumer-groups --command-config playground.config --bootstrap-server <my-boostrap-server> --describe --group my-first-application

# consume from where the offsets have been reset
kafka-console-consumer --consumer.config playground.config --bootstrap-server <my-boostrap-server> --topic third_topic --group my-first-application

# describe the group again
kafka-consumer-groups --command-config playground.config --bootstrap-server <my-boostrap-server> --describe --group my-first-application



############################
#####     LOCALHOST    #####
############################

# look at the documentation again
kafka-consumer-groups

# describe the consumer group
kafka-consumer-groups --bootstrap-server localhost:9092 --describe --group my-first-application

# Dry Run: reset the offsets to the beginning of each partition
kafka-consumer-groups --bootstrap-server localhost:9092 --group my-first-application --reset-offsets --to-earliest --topic third_topic --dry-run

# execute flag is needed
kafka-consumer-groups --bootstrap-server localhost:9092 --group my-first-application --reset-offsets --to-earliest --topic third_topic --execute

# describe the consumer group again
kafka-consumer-groups --bootstrap-server localhost:9092 --describe --group my-first-application

# consume from where the offsets have been reset
kafka-console-consumer --bootstrap-server localhost:9092 --topic third_topic --group my-first-application

# describe the group again
kafka-consumer-groups --bootstrap-server localhost:9092 --describe --group my-first-application