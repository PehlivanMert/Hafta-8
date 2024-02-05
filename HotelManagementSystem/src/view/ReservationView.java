package view;

import business.HotelManager;
import business.ReservationManager;
import business.RoomManager;
import core.Helper;
import entity.Hotel;
import entity.Reservation;
import entity.Room;

import javax.swing.*;
import java.time.LocalDate;

public class ReservationView extends Layout {
    Room room;
    RoomManager roomManager;
    Reservation reservation;
    ReservationManager reservationManager;
    Hotel hotel;
    HotelManager hotelManager;
    private JPanel contanier;
    private JPanel pnl_top;
    private JPanel pnl_mid;
    private JPanel pnl_bottom;
    private JTextField fld_otel_adi;
    private JTextField fld_city;
    private JTextField fld_yildiz;
    private JRadioButton btn_carpark;
    private JRadioButton btn_concierge;
    private JRadioButton btn_wifi;
    private JRadioButton btn_spa;
    private JRadioButton btn_pool;
    private JRadioButton btn_roomserv;
    private JRadioButton btn_fitness;
    private JLabel lbl_otel_name;
    private JLabel lbl_city;
    private JLabel lbl_star;
    private JTextField fld_room_type;
    private JTextField fld_pension_type;
    private JTextField fld_checkin;
    private JTextField fld_checkout;
    private JTextField fld_total;
    private JRadioButton btn_tv;
    private JTextField fld_mkare;
    private JTextField fld_bed;
    private JRadioButton btn_minibar;
    private JRadioButton btn_oyunKonsolu;
    private JRadioButton btn_projeksiyon;
    private JRadioButton btn_kasa;
    private JLabel lbl_room_type;
    private JLabel lbl_pension_type;
    private JLabel lbl_checkin;
    private JLabel lbl_checkout;
    private JLabel lbl_price;
    private JLabel lbl_yatak;
    private JLabel lbl_alan;
    private JLabel lbl_info2;
    private JLabel lbl_info;
    private JLabel lbl_info3;
    private JTextField fld_name;
    private JTextField fld_guestid;
    private JTextField fld_adultcount;
    private JTextField fld_mail;
    private JTextField fld_tel;
    private JButton btn_save;
    private JLabel lbl_name;
    private JLabel lbl_guestid;
    private JLabel lbl_adultcount;
    private JLabel lbl_mail;
    private JLabel lbl_guesttel;
    private JTextField fld_childcount;
    private JLabel lbl_childcount;
    private EmployeeView employeeView;


    public ReservationView(Room room, String checkin, String checkout, int adultCount, int childCount) {


        this.reservationManager = new ReservationManager();
        this.reservation = new Reservation();
        this.room = room;
        this.reservationManager = new ReservationManager();
        this.hotelManager = new HotelManager();
        this.add(contanier);
        this.guiInitiliaze(1000, 800);
        Hotel hotel = hotelManager.getById(room.getHotel_id());

        // pansiyon etkisi
        String a = fld_pension_type.getText();
        double pensionFactor = reservationManager.searchForPensionFactor(hotel.getId(), a);
        //sezon etkisi
        String b = checkin;
        String c = checkout;
        double seasonFactor = reservationManager.searchForSeasonFactor(hotel.getId(), b, c);
        //gece sayısı
        int days = Helper.calculateDays(checkin, checkout);

        //Toplam fiyat
        double adultPrice = room.getAdult_price();
        double childPrice = room.getChild_price();


        if (hotel != null) {


            this.fld_otel_adi.setText(hotel.getName());
            this.fld_city.setText(hotel.getAddress());
            this.fld_yildiz.setText(hotel.getStar());
            this.btn_carpark.setSelected(hotel.isCarPark());
            this.btn_concierge.setSelected(hotel.isConcierge());
            this.btn_spa.setSelected(hotel.isSpa());
            this.btn_wifi.setSelected(hotel.isWifi());
            this.btn_fitness.setSelected(hotel.isFitness());
            this.btn_pool.setSelected(hotel.isPool());
            this.btn_roomserv.setSelected(hotel.isRoomService());
            this.fld_room_type.setText(room.getRoom_type());
            this.fld_pension_type.setText(room.getPension_type());
            this.btn_tv.setSelected(room.isTv());
            this.btn_minibar.setSelected(room.isMinibar());
            this.btn_oyunKonsolu.setSelected(room.isKonsol());
            this.btn_projeksiyon.setSelected(room.isProjeksiyon());
            this.btn_kasa.setSelected(room.isKasa());
            this.fld_bed.setText(String.valueOf(room.getBed_capacity()));
            this.fld_mkare.setText(room.getMkare());
            this.fld_adultcount.setText(String.valueOf(adultCount));
            this.fld_childcount.setText(String.valueOf(childCount));
            this.fld_checkin.setText(checkin);
            this.fld_checkout.setText(checkout);
            this.fld_total.setText(String.valueOf(Helper.CalculatePrice(seasonFactor, pensionFactor, days, adultCount, childCount, adultPrice, childPrice)));

            this.btn_save.addActionListener(e -> {
                if (Helper.isFieldListEmpty(new JTextField[]{this.fld_name, this.fld_guestid, this.fld_adultcount, this.fld_mail, this.fld_tel, this.fld_childcount})) {
                    Helper.showMsg("fill");
                } else {
                    boolean result;

                    this.reservation.setRoom_id(room.getRoom_id());
                    this.reservation.setCheckinDate(LocalDate.parse(fld_checkin.getText()));
                    this.reservation.setCheckoutDate(LocalDate.parse(fld_checkout.getText()));
                    this.reservation.setTotal_price(Double.parseDouble(fld_total.getText()));
                    this.reservation.setGuestCount(Integer.parseInt(fld_adultcount.getText()) + Integer.parseInt(fld_childcount.getText()));
                    this.reservation.setGuestName(fld_name.getText());
                    this.reservation.setGuestId(fld_guestid.getText());
                    this.reservation.setGuestMail(fld_mail.getText());
                    this.reservation.setGuestPhone(fld_tel.getText());


                    if (this.reservation.getReservation_id() != 0) {
                        result = this.reservationManager.update(this.reservation);

                    } else {
                        result = this.reservationManager.save(this.reservation);
                    }

                    if (result) {
                        Helper.showMsg("done");
                        this.dispose();
                    } else {
                        Helper.showMsg("error");
                    }
                }
            });



        }

    }


    /*public ReservationView(Reservation reservation) {

        this.reservation = reservation;
        this.reservationManager = new ReservationManager();
        this.room = roomManager.getById(room.getRoom_id());
        this.reservationManager = new ReservationManager();
        this.hotel = hotelManager.getById(room.getHotel_id());
        this.hotelManager = new HotelManager();
        this.add(contanier);
        this.guiInitiliaze(1000, 800);


        this.fld_otel_adi.setText(this.room.getHotel_name());
        this.fld_city.setText(this.hotel.getAddress());
        this.fld_yildiz.setText(this.hotel.getStar());
        this.btn_carpark.setSelected(this.hotel.isCarPark());
        this.btn_concierge.setSelected(this.hotel.isConcierge());
        this.btn_spa.setSelected(this.hotel.isSpa());
        this.btn_wifi.setSelected(this.hotel.isWifi());
        this.btn_fitness.setSelected(this.hotel.isFitness());
        this.btn_pool.setSelected(this.hotel.isPool());
        this.btn_roomserv.setSelected(this.hotel.isRoomService());


        /*this.btn_save.addActionListener(e -> {
            if (Helper.isFieldListEmpty(new JTextField[]{this.fld_hotelname, this.fld_hoteladres, this.fld_hotelmail, this.fld_hoteltel})) {
                Helper.showMsg("fill");
            } else {
                boolean result;

                this.hotel.setName(fld_hotelname.getText());
                this.hotel.setAddress(fld_hoteladres.getText());
                this.hotel.setPhone(fld_hoteladres.getText());
                this.hotel.setMail(fld_hotelmail.getText());
                this.hotel.setStar((String) cmb_hotel_star.getSelectedItem());
                this.hotel.setCarPark(btn_carpark.isSelected());
                this.hotel.setConcierge(btn_concierge.isSelected());
                this.hotel.setSpa(btn_spa.isSelected());
                this.hotel.setWifi(btn_wifi.isSelected());
                this.hotel.setFitness(btn_fitness.isSelected());
                this.hotel.setPool(btn_pool.isSelected());
                this.hotel.setRoomService(btn_roomsrvc.isSelected());


                if (this.hotel.getId() != 0) {
                    result = this.hotelManager.update(this.hotel);

                } else {
                    result = this.hotelManager.save(this.hotel);
                }

                if (result) {
                    Helper.showMsg("done");
                    this.dispose();
                } else {
                    Helper.showMsg("error");
                }
            }
        });

    }*/

}
