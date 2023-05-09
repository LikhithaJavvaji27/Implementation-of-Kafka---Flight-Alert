import java.time.Duration;
import java.util.*;
import org.apache.kafka.clients.consumer.*;
import org.apache.kafka.common.serialization.StringDeserializer;

public class FlightKafkaConsumer {
    private static final String BOOTSTRAP_SEVERS = "localhost:9092";
    //In Kafka consumers can be organized into groups, and each group is identified by a unique group ID.
    //A consumer application can join a consumer group by setting this variable to a certain value, which will cause it to use that group ID as its identifier.
    //It enables several consumers to read from the same Kafka topic while coordinating with one another.
    private static final String GROUP_ID = "consumer_flight_group";

    public static void main(String[] args) {
        Properties flightproperties = new Properties();
        //ConsumerConfig is a set of properties that define the behaviour of a kafka consumer.
        flightproperties.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, BOOTSTRAP_SEVERS);
        flightproperties.put(ConsumerConfig.GROUP_ID_CONFIG, GROUP_ID);
        flightproperties.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
        flightproperties.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());

        KafkaConsumer<String, String> flightconsumer = new KafkaConsumer<>(flightproperties);
        flightconsumer.subscribe(Arrays.asList("flight_alert", "flight_discount_alert", "flight_delay_alert", "flight_checkin_alert"));

        while(true) {
            ConsumerRecords<String, String> flight_consumer_records = flightconsumer.poll(Duration.ofMillis(100));
            //Here it loops over all the records received from the Kafka topics and assign it to the flight_consumer_record variable one by one.
            for(ConsumerRecord<String, String> flight_consumer_record : flight_consumer_records) {
                //extracts the name of the kafka topic from which the message is received.
                String flight_topic = flight_consumer_record.topic();
                //extracts the actual message received from the kafka topic.
                String message = flight_consumer_record.value();
                //records the current time before processing the message.
                long startTime = System.currentTimeMillis();
                //prints the received message on the console.
                System.out.println("Received message from topic  " + flight_topic + "->" + message);
                if(flight_topic.equals("flight_alert")) {
                    //It process the flight_alert message
                } else if(flight_topic.equals("flight_discount_alert")) {
                    //It process the flight_discount_alert_message
                } else if(flight_topic.equals("flight_delay_alert")) {
                    //It process the flight_delay_alert_message
                } else if(flight_topic.equals("flight_checkin_alert")) {
                    //It process the flight_checkin_alert message
                }
                //records the current time before processing the message.
                long endTime = System.currentTimeMillis();
                long timeTaken = endTime - startTime;
                //On the console it prints the topic name, time taken, and offset of the message.
                System.out.printf("Message processed from topic:%s in %d milliseconds and offset:%d\n", flight_topic, timeTaken, flight_consumer_record.offset());
            }


        }
    }

}
