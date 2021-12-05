import Entity.Seat;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.SeatService;

public class MyTest {

    @Test
    public void test(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        SeatService seatService = (SeatService) context.getBean("seatServiceImpl");
        for(Seat seat:seatService.queryAllSeat()){
            System.out.println(seat);
        }
    }

}
