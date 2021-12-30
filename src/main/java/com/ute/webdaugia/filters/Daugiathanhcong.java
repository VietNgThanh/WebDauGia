package com.ute.webdaugia.filters;

import com.ute.webdaugia.beans.Product;
import com.ute.webdaugia.beans.User;
import com.ute.webdaugia.models.AccountModel;
import com.ute.webdaugia.models.ProductModel;
import com.ute.webdaugia.models.SendMail;

import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.chrono.ChronoLocalDateTime;
import java.util.ArrayList;
import java.util.Date;

@WebFilter(filterName = "Daugiathanhcong")
public class Daugiathanhcong implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        ArrayList<Product> productavai= ProductModel.findProductAvai();
        SimpleDateFormat ab = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timnow = ab.format(java.util.Calendar.getInstance().getTime());
//        for (int i = 0; i < productavai.size(); i++) {
        int len = 0;
        try {
            len = productavai.size();
        }
        catch (NullPointerException e){}
        for (int i = 0; i < len; i++) {
            Product product = productavai.get(i);
            LocalDateTime timee = product.getTime_to_close();
            Instant instant = timee.toInstant(ZoneOffset.UTC);
            Date date = Date.from(instant);
            String time_close = ab.format(date);
            if(timnow.compareTo(time_close) > 0){
                if (product.getId_Bidder_current() > 0) {
                    String mess = "Chuc mung ban da thang dau gia san pham " + product.getName() +
                            " voi gia chien thang " + product.getHighest_price();
                    String messtoseller ="San pham " +product.getName() + "cua ban da có nguoi dau gia thanh cong \n"
                            + "Gia cua san pham la" + product.getHighest_price();
                    User user = AccountModel.findByidUser(product.getId_Bidder_current());
                    User seller = AccountModel.findByidUser(product.getUserid());
                    SendmailtoNguoiThang(user.getEmail(),mess);
                    SendmailtoNguoiban(seller.getEmail(), messtoseller);
                    ProductModel.updateTrangThai(product.getIdProduct());
                }
                else {
                    User seller = AccountModel.findByidUser(product.getUserid());
                    String mess = "San pham " + product.getName() +
                            " da ket thuc nhung khong co dau gia " + " xin chia buon";
                    SendmailtoNguoiThang(seller.getEmail(),mess);
                    ProductModel.updateTrangThai(product.getIdProduct());
                }
            }
        }
        chain.doFilter(req, res);
    }

    private void SendmailtoNguoiThang(String email, String mess) {
        SendMail sendMail = new SendMail();
        try {
            boolean sm = sendMail.Sendmail(email,mess);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private void SendmailtoNguoiban(String email, String mess) {
        SendMail sendMail = new SendMail();
        try {
            boolean sm = sendMail.Sendmail(email,mess);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
