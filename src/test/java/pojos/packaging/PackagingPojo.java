package pojos.packaging;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PackagingPojo {

    /*
    {
       "name": "Gift Box with flower",
       "price": "75.00"
    }
     */

    private String name;
    private String price;
}
