/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test;
import java.io.IOException;  
import java.util.Properties;  
import javax.mail.Folder;  
import javax.mail.Message;  
import javax.mail.MessagingException;  
import javax.mail.NoSuchProviderException;  
import javax.mail.Session;  
import com.sun.mail.pop3.POP3Store;  
  
public class Readmail{  
  
 public static void receiveEmail(String pop3Host, String storeType,  
  String user, String password) {  
  try {  
   //1) get the session object  
   Properties properties = new Properties();  
   properties.put("mail.pop3.host", pop3Host);  
   Session emailSession = Session.getDefaultInstance(properties);  
     
   //2) create the POP3 store object and connect with the pop server  
   POP3Store emailStore = (POP3Store) emailSession.getStore(storeType);  
   emailStore.connect(user, password);  
  
   //3) create the folder object and open it  
   Folder emailFolder = emailStore.getFolder("INBOX");  
   emailFolder.open(Folder.READ_ONLY);  
  
   //4) retrieve the messages from the folder in an array and print it  
   Message[] messages = emailFolder.getMessages();  
   for (int i = 0; i < messages.length; i++) {  
    Message message = messages[i];  
    System.out.println("---------------------------------");  
    System.out.println("Email Number " + (i + 1));  
    System.out.println("Subject: " + message.getSubject());  
    System.out.println("From: " + message.getFrom()[0]);  
    System.out.println("Text: " + message.getContent().toString());  
   }  
  
   //5) close the store and folder objects  
   emailFolder.close(false);  
   emailStore.close();  
  
  } catch (NoSuchProviderException e) {e.printStackTrace();}   
  catch (MessagingException e) {e.printStackTrace();}  
  catch (IOException e) {e.printStackTrace();}  
 }  
  
 public static void main(String[] args) {  
  
  String host = "pop.google.com:995";//change accordingly  
  String mailStoreType = "pop3";  
  String username= "vikas.gist8056@gmail.com";  
  String password= "gistbhopal";//change accordingly  
  
  receiveEmail(host, mailStoreType, username, password);  
  
 }  
}  