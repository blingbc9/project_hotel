package kr.co.hotel.guest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import util.SendMail;
@Service
public class GuestServiceImpl implements GuestService {

	@Autowired
	GuestMapper gmapper;

	@Override
	public int insert(GuestVO gvo) {
		return gmapper.insert(gvo);
	}

	@Override
	public int emailDupCheck(String guest_email) {
		return gmapper.emailDupCheck(guest_email);
	}

	@Override
	public int idDupCheck(String guest_id) {
		return gmapper.idDupCheck(guest_id);
	}
	@Override
	public int hpDupCheck(String guest_hp) {
		return gmapper.hpDupCheck(guest_hp);
	}
	@Override
	public boolean guestloginCheck(GuestVO gvo, HttpSession sess) {
		boolean r = false;
		GuestVO loginInfo = gmapper.guestloginCheck(gvo);
		if (loginInfo != null) {
			r = true;
			// 로그인 성공시 세션에 저장
			sess.setAttribute("loginInfo", loginInfo);
		}
		return r;
	}

	@Override
	public GuestVO findGuestId(GuestVO gvo) {
		return gmapper.findGuestId(gvo);
	}
	@Override
	public GuestVO findGuestPwd(GuestVO gvo) {
		// update
		GuestVO mv = gmapper.findGuestPwd(gvo);
		if (mv != null) {
			// 임시비밀번호 생성
			// 영문두자리, 숫자두자리
			String temp = "";
			for (int i=0; i<2; i++) {
				temp += (char)(Math.random()*26+65);
			}
			for (int i=0; i<3; i++) {
				temp += (int)(Math.random()*9);
			}
			
			// 임시비밀번호 update
			gvo.setGuest_pwd(temp);
			gmapper.updateTempGuestPwd(gvo);
			
			// email발송
			SendMail.sendMail("gdbebe@naver.com", gvo.getGuest_email(), "[둘이놀까]Guest임시비밀번호", "임시비밀번호:"+temp);
			
			return mv;
		} else {
			return null;
		}
	}
	@Override
	public GuestVO myinfoLogin(GuestVO gvo) {
		return gmapper.myinfoLogin(gvo);
		
	}

	@Override
	public int updatePwd(GuestVO gvo) {
		return gmapper.updatePwd(gvo);
	}
	@Override
	public boolean totalUpdate(GuestVO gvo) {
		return gmapper.totalUpdate(gvo) >0 ?  true : false;
	}
	
	@Override
	public GuestVO deleteGuestInfo(GuestVO gvo) {
		// update
				GuestVO mv = gmapper.deleteGuestInfo(gvo);
				if (mv != null) {
					// 임시비밀번호 생성
					// 영문두자리, 숫자두자리
					String temp = "";
					for (int i=0; i<2; i++) {
						temp += (char)(Math.random()*26+65);
					}
					for (int i=0; i<3; i++) {
						temp += (int)(Math.random()*9);
					}
					
					// 임시비밀번호 update
					gvo.setGuest_pwd(temp);
					gmapper.fakeDelete(gvo);
					
					return mv;
				} else {
					return null;
				}
			}
}
