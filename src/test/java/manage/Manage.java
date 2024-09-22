package manage;

public class Manage {

    /**
     * US_01
     **/


    private String Us01_calculates_the_total_meeting_time = "SELECT rm.user_id, SUM(TIMESTAMPDIFF(MINUTE, rm.start_at, rm.end_at)) AS total_meeting_duration FROM u168183796_qainstulearn.reserve_meetings rm JOIN u168183796_qainstulearn.users u ON rm.user_id = u.id WHERE u.email = 'oske.work@gmail.com';";

}
