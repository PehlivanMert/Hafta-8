package view;

import business.HotelManager;
import business.PensionManager;
import business.RoomManager;
import business.SeasonManager;
import core.Helper;
import entity.*;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;

public class EmployeeView extends Layout {

    private JPanel contanier;
    private JPanel pnl_top;
    private JLabel lbl_welcome;
    private JButton btn_logout;
    private JTabbedPane pnl_main;
    private JPanel pnl_hotel;
    private JScrollPane scrl_hotel;
    private JTable tbl_hotel;
    private JButton btn_addhotel;
    private JPanel pnl_room;
    private JPanel pnl_rez;
    private JTable tbl_rez;
    private JPanel pnl_bottom;
    private JScrollPane scl_right;
    private JTable tbl_season;
    private JScrollPane scl_left;
    private JTable tbl_pension;
    private JLabel lbl_sezonlar;
    private JLabel lbl_pansiyonlar;
    private JScrollPane scl_room;
    private JTable tbl_room;
    private JButton btn_add_room;
    private JButton btn_search_room;
    private JButton btn_reset;
    private JTextField fld_room_hotel_name;
    private JTextField fld_room_city;
    private JTextField fld_room_checkin;
    private JTextField fld_room_checkout;
    private JTextField fld_room_adult_count;
    private JTextField fld_room_child_count;
    private JLabel lbl_hotelname;
    private JLabel lbl_sehir;
    private JLabel lbl_giris;
    private JLabel lbl_cikis;
    private JLabel lbl_adultcount;
    private JLabel lbl_childcount;
    private User user;
    private DefaultTableModel tmdl_hotel = new DefaultTableModel();
    private DefaultTableModel tmdl_season = new DefaultTableModel();
    private DefaultTableModel tmdl_pension = new DefaultTableModel();
    private DefaultTableModel tmdl_room = new DefaultTableModel();
    private HotelManager hotelManager;
    private SeasonManager seasonManager;
    private PensionManager pensionManager;
    private RoomManager roomManager;
    private JPopupMenu hotel_menu;
    private JPopupMenu season_menu;
    private JPopupMenu pension_menu;
    private JPopupMenu room_menu;
    private JPopupMenu rez_menu;
    private Object[] col_season;
    private Object[] col_pension;
    private Object[] col_room;
    private Object[] col_reservation;

    public EmployeeView(User user) {
        this.seasonManager = new SeasonManager();
        this.hotelManager = new HotelManager();
        this.pensionManager = new PensionManager();
        this.roomManager = new RoomManager();
        this.add(contanier);
        this.guiInitiliaze(1500, 800);
        this.user = user;

        this.lbl_welcome.setText("Hoşgeldiniz " + this.user.getUsername());

        //Hotel
        loadHotelTable();
        loadHotelComponent();

        //Season
        loadSeasonTable();
        loadSeasonComponent();

        //Pension
        loadPensionTable();
        loadPensionComponent();

        //Room
        loadRoomTable();
        //loadRoomComponent();

        //Rez


        btn_logout.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                dispose();
            }
        }); // Çıkış
        btn_addhotel.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                HotelView hotelView = new HotelView(new Hotel());
                hotelView.addWindowListener(new WindowAdapter() {
                    @Override
                    public void windowClosed(WindowEvent e) {
                        loadHotelTable();

                    }
                });

            }
        }); //Otel Ekleme butonu
    }

    public void loadHotelTable() {
        Object[] col_hotel = {"ID", "Otel Adı", "Adres", "Mail", "Telefon", "Yıldız", "Otopark", "Wifi", "Havuz", "Fitness", "Concierge", "Spa", "Oda Servisi"};
        ArrayList<Object[]> hotelList = this.hotelManager.getForTable(col_hotel.length, this.hotelManager.findAll());
        this.createTable(this.tmdl_hotel, this.tbl_hotel, col_hotel, hotelList);
    }

    public void loadHotelComponent() {
        tableSelectedRow(this.tbl_hotel);

        this.hotel_menu = new JPopupMenu();
        this.hotel_menu.add("Yeni").addActionListener(e -> {

            HotelView hotelView = new HotelView(new Hotel());
            hotelView.addWindowListener(new WindowAdapter() {
                @Override
                public void windowClosed(WindowEvent e) {
                    loadHotelTable();

                }
            });
        });
        this.hotel_menu.add("Güncelle").addActionListener(e -> {
            int selectHotelId = this.getTableSelectedRow(this.tbl_hotel, 0);
            HotelView hotelView = new HotelView(this.hotelManager.getById(selectHotelId));
            hotelView.addWindowListener(new WindowAdapter() {
                @Override
                public void windowClosed(WindowEvent e) {
                    loadHotelTable();

                }
            });
        });

        this.hotel_menu.add("Sil").addActionListener(e -> {
            if (Helper.confirm("sure")) {
                int selectHotelId = this.getTableSelectedRow(this.tbl_hotel, 0);
                if (this.hotelManager.delete(selectHotelId)) {
                    Helper.showMsg("done");
                    loadHotelTable();

                } else {
                    Helper.showMsg("error");
                }
            }
        });
        this.tbl_hotel.setComponentPopupMenu(hotel_menu);

    }

    public void loadSeasonTable() {

        Object[] col_season = {"ID", "Otel ID", "Başlangıç Tarihi", "Bitiş Tarihi"};
        ArrayList<Object[]> seasonList = this.seasonManager.getForTable(col_season.length, this.seasonManager.findAll());
        this.createTable(this.tmdl_season, this.tbl_season, col_season, seasonList);

    }

    public void loadSeasonComponent() {
        tableSelectedRow(this.tbl_season);

        this.season_menu = new JPopupMenu();
        this.season_menu.add("Yeni").addActionListener(e -> {

            SeasonView seasonView = new SeasonView(new Season());
            seasonView.addWindowListener(new WindowAdapter() {
                @Override
                public void windowClosed(WindowEvent e) {
                    loadSeasonTable();

                }
            });
        });
        this.season_menu.add("Güncelle").addActionListener(e -> {
            int selectSeasonId = this.getTableSelectedRow(this.tbl_season, 0);
            SeasonView seasonView = new SeasonView(this.seasonManager.getById(selectSeasonId));
            seasonView.addWindowListener(new WindowAdapter() {
                @Override
                public void windowClosed(WindowEvent e) {
                    loadSeasonTable();

                }
            });
        });

        this.season_menu.add("Sil").addActionListener(e -> {
            if (Helper.confirm("sure")) {
                int selectSeasonId = this.getTableSelectedRow(this.tbl_season, 0);
                if (this.seasonManager.delete(selectSeasonId)) {
                    Helper.showMsg("done");
                    loadSeasonTable();

                } else {
                    Helper.showMsg("error");
                }
            }
        });
        this.tbl_season.setComponentPopupMenu(season_menu);

    }

    public void loadPensionTable() {

        Object[] col_pension = {"ID", "Otel ID", "Pansiyon Tipi"};
        ArrayList<Object[]> pensionList = this.pensionManager.getForTable(col_pension.length, this.pensionManager.findAll());
        this.createTable(this.tmdl_pension, this.tbl_pension, col_pension, pensionList);

    }

    public void loadPensionComponent() {
        tableSelectedRow(this.tbl_pension);

        this.pension_menu = new JPopupMenu();
        this.pension_menu.add("Yeni").addActionListener(e -> {

            PensionView pensionView = new PensionView(new Pension());
            pensionView.addWindowListener(new WindowAdapter() {
                @Override
                public void windowClosed(WindowEvent e) {
                    loadPensionTable();

                }
            });
        });
        this.pension_menu.add("Güncelle").addActionListener(e -> {
            int selectPensionId = this.getTableSelectedRow(this.tbl_pension, 0);
            PensionView pensionView = new PensionView(this.pensionManager.getById(selectPensionId));
            pensionView.addWindowListener(new WindowAdapter() {
                @Override
                public void windowClosed(WindowEvent e) {
                    loadPensionTable();

                }
            });
        });

        this.pension_menu.add("Sil").addActionListener(e -> {
            if (Helper.confirm("sure")) {
                int selectPensionId = this.getTableSelectedRow(this.tbl_pension, 0);
                if (this.pensionManager.delete(selectPensionId)) {
                    Helper.showMsg("done");
                    loadPensionTable();

                } else {
                    Helper.showMsg("error");
                }
            }
        });
        this.tbl_pension.setComponentPopupMenu(pension_menu);

    }

    public void loadRoomTable() {

        Object[] col_room = {"ID", "Otel Adı", "Pansiyon Tipi", "Oda Tipi", "Stok", "Yetişkin Fiyatı", "Çocuk Fiyatı", "Yatak Sayısı", "Metrekare", "TV", "Minibar", "Konsol", "Kasa", "Projeksiyon"};
        ArrayList<Object[]> roomList = this.roomManager.getForTable(col_room.length, this.roomManager.findAll());
        this.createTable(this.tmdl_room, this.tbl_room, col_room, roomList);

    }
/*
    public void loadRoomComponent() {
        tableSelectedRow(this.tbl_room);

        this.room_menu = new JPopupMenu();
        this.room_menu.add("Yeni").addActionListener(e -> {

            RoomView roomView = new RoomView(new Room());
            roomView.addWindowListener(new WindowAdapter() {
                @Override
                public void windowClosed(WindowEvent e) {
                    loadRoomTable();

                }
            });
        });
        this.room_menu.add("Güncelle").addActionListener(e -> {
            int selectRoomId = this.getTableSelectedRow(this.tbl_room, 0);
            RoomView roomView = new RoomView(this.roomManager.getById(selectRoomId));
            roomView.addWindowListener(new WindowAdapter() {
                @Override
                public void windowClosed(WindowEvent e) {
                    loadRoomTable();

                }
            });
        });

        this.room_menu.add("Sil").addActionListener(e -> {
            if (Helper.confirm("sure")) {
                int selectRoomId = this.getTableSelectedRow(this.tbl_room, 0);
                if (this.roomManager.delete(selectRoomId)) {
                    Helper.showMsg("done");
                    loadRoomTable();

                } else {
                    Helper.showMsg("error");
                }
            }
        });
        this.tbl_room.setComponentPopupMenu(room_menu);

    }
*/
}


