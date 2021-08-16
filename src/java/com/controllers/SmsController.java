package com.controllers;

import com.test.RandomString;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class SmsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String op = request.getParameter("op");
        if(op.equalsIgnoreCase("varifyotp")){
            String otp1 = request.getParameter("otp");
            HttpSession session = request.getSession();
            String otp2 = (String)session.getAttribute("otp");
            if(otp1.equals(otp2)){
                out.println("<b>Varified</b>");
                session.removeAttribute("otp");
            }
            else
                out.println("<b><font color='red'>Not varified</font></b>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            //response.setContentType("text/html");
            String op = request.getParameter("op");
            if (op.equalsIgnoreCase("sendsms")) {
                System.out.println("1");
                String message = URLEncoder.encode(request.getParameter("sms"), "UTF-8");    //Important Step
                String mobiles = request.getParameter("mobile");
                String sendId = "TXTIND";
                String language = "english";
                String route = "v3";
                String apiKey = "pDwzYosH5y6vbAkihJ1RcIjZutBn3EMV0Lfdx8qaFe97CS4KmraDthGbgjCT2uUoEL1XNSny3dQ9KIJm";
                String myUrl = "https://www.fast2sms.com/dev/bulkV2?authorization=" + apiKey + "&message=" + message + "&language=" + language + "&route=" + route + "&numbers=8878128218";
                System.out.println("2");
                URL url = new URL(myUrl);
                HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
                con.setRequestMethod("GET");
                con.setRequestProperty("User-Agent", "Mozilla/5.0");
                con.setRequestProperty("cache-control", "no-cache");
                System.out.println("3");
                int responseCode = con.getResponseCode(); //200 for success
                System.out.println("4");
                if (responseCode == 200) {
                    response.sendRedirect("test/smsapi2.jsp?msg=Message sent successfully");
                } else {
                    response.sendRedirect("test/smsapi2.jsp?msg=Message is not sent ");

                }

            }

            if (op.equalsIgnoreCase("sendotp")) {
                System.out.println("1");
                String message = RandomString.getAlphaNumericString(6);
                String mobiles = request.getParameter("mobile");
                String sendId = "TXTIND";
                String language = "english";
                String route = "v3";
                String apiKey = "pDwzYosH5y6vbAkihJ1RcIjZutBn3EMV0Lfdx8qaFe97CS4KmraDthGbgjCT2uUoEL1XNSny3dQ9KIJm";
                String myUrl = "https://www.fast2sms.com/dev/bulkV2?authorization=" + apiKey + "&message=" + message + "&language=" + language + "&route=" + route + "&numbers=8878128218";
                System.out.println("2");
                URL url = new URL(myUrl);
                HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
                con.setRequestMethod("GET");
                con.setRequestProperty("User-Agent", "Mozilla/5.0");
                con.setRequestProperty("cache-control", "no-cache");
                System.out.println("3");
                int responseCode = con.getResponseCode(); //200 for success
                System.out.println("4");
                if (responseCode == 200) {
                    HttpSession session = request.getSession();
                    session.setAttribute("otp",message);
                    out.println("OTP sent successfully");
                    System.out.println("5");
                } else {
                    out.println("OTP is not sent ");

                }

            }

        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }
    }

}
