// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlightBookingContract {
    // Koltuk rezervasyon verilerini depolamak için bir yapı
    struct Booking {
        address customer;
        uint256 totalAmount;
        string seatNumbers;
    }

    // Rezervasyonlar listesi
    Booking[] public bookings;

    // Rezervasyon yapıldığında tetiklenecek event
    event Book(address indexed customer, uint256 totalAmount, string seatNumbers);

    // Rezervasyon yapılabilmesi için payable bir fonksiyon
    function bookSeats(string memory seatNumbers) public payable {
        // msg.sender ve msg.value, işlemi gönderen kişi ve gönderilen Ether miktarını temsil eder
        bookings.push(Booking({
            customer: msg.sender,
            totalAmount: msg.value,
            seatNumbers: seatNumbers
        }));

        emit Book(msg.sender, msg.value, seatNumbers);
    }

    // Rezervasyonlar listesinin uzunluğunu döndüren bir fonksiyon
    function getBookingsCount() public view returns (uint256) {
        return bookings.length;
    }

    // Belirli bir indeksteki rezervasyonu getiren bir fonksiyon
    function getBooking(uint256 index) public view returns (address, uint256, string memory) {
        return (bookings[index].customer, bookings[index].totalAmount, bookings[index].seatNumbers);
    }
}
