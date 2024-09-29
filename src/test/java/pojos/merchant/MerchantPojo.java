package pojos.merchant;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MerchantPojo {

    /*
    {
      "business_name":"Merchant Firm AŞ",
      "mobile":"9999999990",
      "email":"test787@gmail.com"
     }
     */

    private String business_name;
    private String mobile;
    private String email;
}
