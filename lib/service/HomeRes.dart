// To parse this JSON data, do
//
//     final homeRes = homeResFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

HomeRes homeResFromJson(String str) => HomeRes.fromJson(json.decode(str));

String homeResToJson(HomeRes data) => json.encode(data.toJson());

@JsonSerializable()
class HomeRes {
    HomeRes({
        this.status,
        this.data,
    });

    int status;
    List<Datum> data;

    factory HomeRes.fromJson(Map<String, dynamic> json) => HomeRes(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.assignTo,
        this.assignFrom,
        this.agreementStatus,
        this.securityAmountStatus,
        this.buildingId,
        this.assignEnrollId,
        this.startDate,
        this.endDate,
        this.addedOn,
        this.userId,
        this.enrollId,
        this.userType,
        this.maxAddProp,
        this.uName,
        this.uEmail,
        this.uPassword,
        this.isUserPaid,
        this.uDate,
        this.username,
        this.currency,
        this.mobile,
        this.profile,
        this.googlePic,
        this.forgotOtp,
        this.verifyotp,
        this.verificationStatus,
        this.buildingName,
        this.address,
        this.price,
        this.rentalDate,
        this.rentDueDate,
        this.securityAmount,
        this.ownerId,
        this.numberUnits,
        this.latitude,
        this.longitude,
        this.registrationNum,
        this.amenitiesId,
        this.area,
        this.country,
        this.city,
        this.state,
        this.pincode,
        this.note,
        this.buildingImage,
        this.bookedStatus,
        this.rentStatus,
        this.securityStatus,
        this.rentDue,
    });

    String id;
    String assignTo;
    String assignFrom;
    String agreementStatus;
    String securityAmountStatus;
    String buildingId;
    String assignEnrollId;
    String startDate;
    String endDate;
    DateTime addedOn;
    String userId;
    String enrollId;
    String userType;
    String maxAddProp;
    String uName;
    String uEmail;
    String uPassword;
    String isUserPaid;
    dynamic uDate;
    dynamic username;
    String currency;
    String mobile;
    dynamic profile;
    String googlePic;
    String forgotOtp;
    dynamic verifyotp;
    String verificationStatus;
    String buildingName;
    String address;
    String price;
    String rentalDate;
    DateTime rentDueDate;
    String securityAmount;
    String ownerId;
    dynamic numberUnits;
    dynamic latitude;
    dynamic longitude;
    String registrationNum;
    dynamic amenitiesId;
    String area;
    String country;
    String city;
    String state;
    String pincode;
    String note;
    String buildingImage;
    String bookedStatus;
    String rentStatus;
    String securityStatus;
    List<dynamic> rentDue;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        assignTo: json["assign_to"] == null ? null : json["assign_to"],
        assignFrom: json["assign_from"] == null ? null : json["assign_from"],
        agreementStatus: json["agreement_status"] == null ? null : json["agreement_status"],
        securityAmountStatus: json["security_amount_status"] == null ? null : json["security_amount_status"],
        buildingId: json["building_id"] == null ? null : json["building_id"],
        assignEnrollId: json["assign_enroll_id"] == null ? null : json["assign_enroll_id"],
        startDate: json["start_date"] == null ? null : json["start_date"],
        endDate: json["end_date"] == null ? null : json["end_date"],
        addedOn: json["added_on"] == null ? null : DateTime.parse(json["added_on"]),
        userId: json["user_id"] == null ? null : json["user_id"],
        enrollId: json["enroll_id"] == null ? null : json["enroll_id"],
        userType: json["user_type"] == null ? null : json["user_type"],
        maxAddProp: json["max_add_prop"] == null ? null : json["max_add_prop"],
        uName: json["u_name"] == null ? null : json["u_name"],
        uEmail: json["u_email"] == null ? null : json["u_email"],
        uPassword: json["u_password"] == null ? null : json["u_password"],
        isUserPaid: json["is_user_paid"] == null ? null : json["is_user_paid"],
        uDate: json["u_date"],
        username: json["username"],
        currency: json["currency"] == null ? null : json["currency"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        profile: json["profile"],
        googlePic: json["google_pic"] == null ? null : json["google_pic"],
        forgotOtp: json["forgot_otp"] == null ? null : json["forgot_otp"],
        verifyotp: json["verifyotp"],
        verificationStatus: json["verification_status"] == null ? null : json["verification_status"],
        buildingName: json["building_name"] == null ? null : json["building_name"],
        address: json["address"] == null ? null : json["address"],
        price: json["price"] == null ? null : json["price"],
        rentalDate: json["rental_date"] == null ? null : json["rental_date"],
        rentDueDate: json["rent_due_date"] == null ? null : DateTime.parse(json["rent_due_date"]),
        securityAmount: json["security_amount"] == null ? null : json["security_amount"],
        ownerId: json["owner_id"] == null ? null : json["owner_id"],
        numberUnits: json["number_units"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        registrationNum: json["registration_num"] == null ? null : json["registration_num"],
        amenitiesId: json["amenities_id"],
        area: json["area"] == null ? null : json["area"],
        country: json["country"] == null ? null : json["country"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        note: json["note"] == null ? null : json["note"],
        buildingImage: json["building_image"] == null ? null : json["building_image"],
        bookedStatus: json["booked_status"] == null ? null : json["booked_status"],
        rentStatus: json["rent_status"] == null ? null : json["rent_status"],
        securityStatus: json["security_status"] == null ? null : json["security_status"],
        rentDue: json["rent_due"] == null ? null : List<dynamic>.from(json["rent_due"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "assign_to": assignTo == null ? null : assignTo,
        "assign_from": assignFrom == null ? null : assignFrom,
        "agreement_status": agreementStatus == null ? null : agreementStatus,
        "security_amount_status": securityAmountStatus == null ? null : securityAmountStatus,
        "building_id": buildingId == null ? null : buildingId,
        "assign_enroll_id": assignEnrollId == null ? null : assignEnrollId,
        "start_date": startDate == null ? null : startDate,
        "end_date": endDate == null ? null : endDate,
        "added_on": addedOn == null ? null : addedOn.toIso8601String(),
        "user_id": userId == null ? null : userId,
        "enroll_id": enrollId == null ? null : enrollId,
        "user_type": userType == null ? null : userType,
        "max_add_prop": maxAddProp == null ? null : maxAddProp,
        "u_name": uName == null ? null : uName,
        "u_email": uEmail == null ? null : uEmail,
        "u_password": uPassword == null ? null : uPassword,
        "is_user_paid": isUserPaid == null ? null : isUserPaid,
        "u_date": uDate,
        "username": username,
        "currency": currency == null ? null : currency,
        "mobile": mobile == null ? null : mobile,
        "profile": profile,
        "google_pic": googlePic == null ? null : googlePic,
        "forgot_otp": forgotOtp == null ? null : forgotOtp,
        "verifyotp": verifyotp,
        "verification_status": verificationStatus == null ? null : verificationStatus,
        "building_name": buildingName == null ? null : buildingName,
        "address": address == null ? null : address,
        "price": price == null ? null : price,
        "rental_date": rentalDate == null ? null : rentalDate,
        "rent_due_date": rentDueDate == null ? null : "${rentDueDate.year.toString().padLeft(4, '0')}-${rentDueDate.month.toString().padLeft(2, '0')}-${rentDueDate.day.toString().padLeft(2, '0')}",
        "security_amount": securityAmount == null ? null : securityAmount,
        "owner_id": ownerId == null ? null : ownerId,
        "number_units": numberUnits,
        "latitude": latitude,
        "longitude": longitude,
        "registration_num": registrationNum == null ? null : registrationNum,
        "amenities_id": amenitiesId,
        "area": area == null ? null : area,
        "country": country == null ? null : country,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "pincode": pincode == null ? null : pincode,
        "note": note == null ? null : note,
        "building_image": buildingImage == null ? null : buildingImage,
        "booked_status": bookedStatus == null ? null : bookedStatus,
        "rent_status": rentStatus == null ? null : rentStatus,
        "security_status": securityStatus == null ? null : securityStatus,
        "rent_due": rentDue == null ? null : List<dynamic>.from(rentDue.map((x) => x)),
    };
}
