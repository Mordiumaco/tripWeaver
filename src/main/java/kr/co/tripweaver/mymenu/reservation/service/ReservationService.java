package kr.co.tripweaver.mymenu.reservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.mymenu.reservation.dao.IReservationDao;

@Service
public class ReservationService implements IReservationService{

	@Autowired
	IReservationDao reservationDao;
	
}
