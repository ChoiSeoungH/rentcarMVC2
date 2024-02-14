package com.basic.rentcar.fronController;

import com.basic.rentcar.controller.rentcar.*;
import com.basic.rentcar.controller.user.LoginCheckController;
import com.basic.rentcar.controller.user.LogoutCheckController;
import com.basic.rentcar.controller.user.MainController;

import java.util.HashMap;

public class HandlerMapping {
  private HashMap<String, Controller> mappings;

  public HandlerMapping() {
    mappings = new HashMap<String, Controller>();
    mappings.put("/main.do", new MainController());
    mappings.put("/loginCheck.do", new LoginCheckController());
    mappings.put("/logoutCheck.do", new LogoutCheckController());
    mappings.put("/carMain.do", new CarMainController());
    mappings.put("/carInfo.do", new CarInfoController());
    mappings.put("/carList.do", new CarListController());
    mappings.put("/deleteRes.do", new DeleteResController());
    mappings.put("/insertCar.do", new InsertCarController());
    mappings.put("/reservateCar.do", new ReservateCarController());
    mappings.put("/selectCarOption.do", new SelectCarOptionController());
    mappings.put("/uploadCarImg.do", new UploadCarImgController());
    mappings.put("/userReserveList.do", new UserReserveListController());

  }

  public Controller getController(String key) {
    return mappings.get(key);
  }
}