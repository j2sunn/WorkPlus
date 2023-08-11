package net.approval.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.approval.db.ApprovalDAO;
import net.dept.db.Dept;
import net.member.db.Member;


public class ApprovalWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<Dept> deptList = new ArrayList<>();
		ArrayList<Member> memberList = new ArrayList<>();
		ApprovalDAO dao = new ApprovalDAO();
		
		deptList = dao.getDeptList();
		memberList = dao.getMemberList();
		
		
		HttpSession session = request.getSession();
		session.setAttribute("menu", "user"); // admin, user
		session.setAttribute("selectedmenu", "approval");
		
		request.setAttribute("deptList", deptList);
		request.setAttribute("memberList", memberList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("approval/ApprovalWrite.jsp");
		
		return forward;
	}

}
