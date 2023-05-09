# Implementation-of-Kafka---Flight-Alert

**About the Project Implementation of Kafka - Flight Alert:**
Apache Kafka is a distributed publish-subscribe messaging system and a reliable queue that can handle an enormous amount of data and enables you pass messages from one endpoint to another. Both offline and online message consumption are suitable for Kafka. So, the goal of our project is to implement an end-to-end use case to send alerts about the respective Flight Details by using Kafka as the
streaming platform.

**Steps of Execution and commands:**
1. Navigate to the path where Zookeeper and Kafka is unzipped.

2. Command to Start Zookeeper
bin/zkServer.sh start-foreground

3. Command to Start Kafka
bin/kafka-server-start.sh config/server.properties

4. Command to Create each Topic:
bin/kafka-topics.sh --create --topic flight_alert --bootstrap-server localhost:9092
bin/kafka-topics.sh --create --topic flight_discount_alert --bootstrap-server localhost:9092
bin/kafka-topics.sh --create --topic flight_delay_alert --bootstrap-server localhost:9092
bin/kafka-topics.sh --create --topic flight_checkin_alert --bootstrap-server localhost:9092


5. Command to Run time log of each Topic:
bin/kafka-console-consumer.sh --topic flight_alert --from-beginning --bootstrap-server localhost:9092
bin/kafka-console-consumer.sh --topic flight_discount_alert --from-beginning --bootstrap-server localhost:9092
bin/kafka-console-consumer.sh --topic flight_delay_alert --from-beginning --bootstrap-server localhost:9092
bin/kafka-console-consumer.sh --topic flight_checkin_alert --from-beginning --bootstrap-server localhost:9092

6. Once Kafka is setup. Below are the dependencies to set up the project.
	1. Java 8
	2. MySQL

7. To run the code.
   A. First start the Zookeeper session.
   B. Second start the Kafka Session.
   C. Next, Create topics
   D. Initially run the FlightKafkaConsumer class. As it is running on the behind now run the FlightKafkaProducer class. 
   E. Now you can see the output
