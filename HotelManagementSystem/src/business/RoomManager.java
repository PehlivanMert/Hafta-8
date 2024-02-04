package business;

import core.Helper;
import dao.RoomDao;
import entity.Room;

import java.util.ArrayList;

public class RoomManager {
    private final RoomDao roomDao;
    private HotelManager hotelManager;

    public RoomManager() {
        this.roomDao = new RoomDao();
    }

    public ArrayList<Object[]> getForTable(int size, ArrayList<Room> rooms) {
        ArrayList<Object[]> roomObjList = new ArrayList<>();
        for (Room obj : rooms) {
            Object[] rowObject = new Object[size];

            int i = 0;
            rowObject[i++] = obj.getRoom_id();
            rowObject[i++] = obj.getHotel_name();
            rowObject[i++] = obj.getPension_type();
            rowObject[i++] = obj.getRoom_type();
            rowObject[i++] = obj.getStock();
            rowObject[i++] = obj.getAdult_price();
            rowObject[i++] = obj.getChild_price();
            rowObject[i++] = obj.getBed_capacity();
            rowObject[i++] = obj.getMkare();
            rowObject[i++] = obj.isTv();
            rowObject[i++] = obj.isMinibar();
            rowObject[i++] = obj.isKonsol();
            rowObject[i++] = obj.isKasa();
            rowObject[i++] = obj.isProjeksiyon();


            roomObjList.add(rowObject);
        }
        return roomObjList;
    }

    public ArrayList<Room> findAll() {
        return this.roomDao.findAll();
    }

    public boolean save(Room room) {
        if (room.getRoom_id() != 0) {
            Helper.showMsg("error");
        }
        return this.roomDao.save(room);
    }

    public Room getById(int id) {
        return this.roomDao.getById(id);
    }

    public boolean update(Room room) {
        if (this.getById(room.getRoom_id()) == null) {
            Helper.showMsg("notfound");
        }
        return this.roomDao.update(room);
    }

    public boolean delete(int id) {
        if (this.getById(id) == null) {
            Helper.showMsg("notfound");
            return false;
        }
        return this.roomDao.delete(id);
    }

}

