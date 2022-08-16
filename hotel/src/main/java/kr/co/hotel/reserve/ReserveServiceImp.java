package kr.co.hotel.reserve;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.hotel.coupon.CouponVO;
import kr.co.hotel.guest.GuestVO;

@Service
public class ReserveServiceImp implements ReserveService {

	@Autowired
	ReserveMapper mapper;
	
	@Override
	public GuestVO select(GuestVO vo) {
		return mapper.select(vo);
	}

	@Override
	public void insert(ReserveVO vo,GuestVO gvo) {
		mapper.insert(vo);
		mapper.guestUsedPointUpdate(gvo);
		mapper.pointinsert(vo);
		mapper.updateCoupon(vo);
	}

	@Override
	public int reservecheck(ReserveVO vo) {
		return mapper.reservecheck(vo);
	}

	@Override
	public List<GuestVO> couponlist(GuestVO vo) {
		return mapper.couponlist(vo);
	}

	@Override
	public int CouponDelete() {
		return mapper.CounponDelete();
	}

	@Override
	public void PointDeposit(ReserveVO vo, GuestVO gvo) {
		mapper.UpdatePointDeposit(vo);
		int point_depoist = (int)(vo.getTotal_price()*0.09);
		gvo.setTotalpoint(gvo.getTotalpoint()+point_depoist);
		mapper.guestUsedPointUpdate(gvo);
		vo.setUsed_point(point_depoist);
		mapper.UpdatePointDeposit(vo);
	}
}
