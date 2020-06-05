package ru.javaops.masterjava.service.mail;

import com.google.common.collect.ImmutableList;

public class MailWSClientMain {
    public static void main(String[] args) {
        MailWSClient.sendMail(
                ImmutableList.of(new Addressee("To <iizdepskyy112@gmail.com>")),
                ImmutableList.of(new Addressee("Copy <johnystartup@gmail.com>")), "Subject", "Body");
    }
}