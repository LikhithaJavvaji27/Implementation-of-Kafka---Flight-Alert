import java.util.*;
import java.sql.*;
import org.apache.kafka.clients.producer.*;
import org.apache.kafka.common.serialization.StringSerializer;

public class FlightKafkaProducer {

    //creating a constant variable BOOTSTRAP_SERVERS and assigning it, the value of the Kafka broker address and port number.
    private static final String BOOTSTRAP_SERVERS = "localhost:9092";

    public static void main(String[] args) throws Exception {
        //The flightproperties object is used to specify various configuration properties for the Kafka producer.
        Properties flightproperties = new Properties();
        //ProducerConfig is a set of key-value pairs that define the behaviour of a kafka producer.
        //Here the BOOTSTRAP_SERVERS_CONFIG property set to the value of BOOTSTRAP_SERVERS
        //BOOTSTRAP_SERVERS is the address of the kafka broker that the producer will connect to.
        flightproperties.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, BOOTSTRAP_SERVERS);
        //KEY_SERIALIZER_CLASS_CONFIG and VALUE_SERIALIZER_CLASS_CONFIG properties are set to the StringSerializer class name.
        //This is used to serialize the key and value of each message to be sent to kafka.
        flightproperties.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());
        flightproperties.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class.getName());


        //Here flightproducer is initialized with a set of properties specified by the flightproperties object.
        Producer<String, String> flightproducer = new KafkaProducer<>(flightproperties);
        //query to retrieve results from DB.
        String flightquery = "SELECT * from flight";


        try {
            //Forming connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/AdvanceDB", "root", "Liki@2798");
            System.out.println("Database Connected Successfully");
            PreparedStatement stmt = con.prepareStatement(flightquery);
            ResultSet rs = stmt.executeQuery();


            while (rs.next()) {
                //Retrieves the results for each attribute from the database.
                String flight_id = rs.getString("flight_id");
                String airline = rs.getString("airline");
                String origin = rs.getString("origin");
                String destination = rs.getString("destination");
                Timestamp departure_time = rs.getTimestamp("departure_time");
                Timestamp arrival_time = rs.getTimestamp("arrival_time");
                String actual_price = rs.getString("actual_price");
                String discount_price = rs.getString("discount_price");
                Timestamp delayed_time = rs.getTimestamp("delayed_time");
                String message_type = rs.getString("message_type");
                //Here the message variable is initialized which can be used to create a message and send to kafka.
                String message = "";

                //In the table there is a attribute called message_type.
                //So here it checks the message_type and retrieves the appropriate message.
                if(message_type.equals("flight_alert")) {
                    message = String.format("We will see you soon! Flight %s %s from %s to %s departs at %s and arrives at %s. Happy Journey!!", flight_id, airline, origin, destination, departure_time.toString(), arrival_time.toString());
                } else if(message_type.equals("flight_discount_alert")) {
                    message = String.format("Hurry Up!! Special Discount on your planned International trip of flight %s %s from %s to %s on %s of price %s. Now for you the discount price is %s", flight_id, airline, origin, destination, departure_time.toString(), actual_price, discount_price);
                } else if(message_type.equals("flight_delay_alert")) {
                    message = String.format("Your flight %s has been delayed due to adverse weather conditions near to your destination. Your new arrival time is %s. Apologies the %s team", flight_id, delayed_time.toString(), airline);
                } else if(message_type.equals("flight_checkin_alert")) {
                    message = String.format("Its time to check in your flight %s from %s to %s. Your flight departs at %s and arrives at %s",
                            flight_id, origin, destination, departure_time.toString(), arrival_time.toString());
                }
                //Initialising the start time to check how much time it would take to send the message to the kafka broker.
                long startTime = System.currentTimeMillis();
                //flightrecord is a new instance of a kafka producer record object that will be sent to kafka by the producer.
                //meesage_type is the name of the kafka topic to which the message will be sent.
                //message is the payload as a string.
                ProducerRecord<String, String> flightrecord = new ProducerRecord<>(message_type, message);
                //Here this block of code is setting up a callback function that will be executed once the Kafka producer sends a message to a broker.
                flightproducer.send(flightrecord, new Callback() {
                    @Override
                    //This method calculates the time taken to send the message.
                    public void onCompletion(RecordMetadata metadata, Exception exception) {
                        long endTime = System.currentTimeMillis();
                        long timeTaken = endTime - startTime;
                        if (exception != null) {
                            exception.printStackTrace();
                        } else {
                            //On the console it will print topic name, partition and offset where the message was sent.
                            //Along with the time taken to send the message.
                            System.out.printf("Message sent to topic:%s, partition:%d, offset:%d in %d milliseconds\n",
                                    metadata.topic(), metadata.partition(), metadata.offset(), timeTaken);
                        }
                    }
                });
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        //flush() is used to ensure that all the messages are sent successfully.
        flightproducer.flush();
        flightproducer.close();
    }
}
