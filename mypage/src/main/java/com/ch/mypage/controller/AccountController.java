package com.ch.mypage.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.mypage.model.Account;
import com.ch.mypage.model.AccountBook;
import com.ch.mypage.service.AccountBookService;
import com.ch.mypage.service.AccountService;

@Controller
public class AccountController {
	@Autowired
	private AccountService as;
	@Autowired
	private AccountBookService abs;

	@RequestMapping("/AccountMain")
	public String AccountMain() {
		return "Account/AccountMain";
	}

	@RequestMapping("/AccountInsertForm")
	public String AccountInsertForm() {
		return "Account/AccountInsertForm";
	}

	@RequestMapping(value = "/accountNumChk", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String accountNumChk(int accountNum) {
		System.out.println(accountNum);
		String msg = "";
		Account acc = as.accountNumChk(accountNum);
		if (acc == null)
			msg = "true";
		else
			msg = "이미 사용중인 계좌번호입니다";
		return msg;
	}

	@RequestMapping("/AccountInsert")
	public String AccountInsert(Account account, Model model) {
		int result = 0;
		result = as.AccountInsert(account);
		model.addAttribute("result", result);
		return "Account/AccountInsert";
	}

	@RequestMapping("/AccountList")
	public String AccountList(HttpSession session, Model model) {
		int memberNum = (Integer) session.getAttribute("memberNum");
		Collection<Account> AccountList = as.AccountList(memberNum);
		model.addAttribute("AccountList", AccountList);
		return "Account/AccountList";
	}

	@RequestMapping("/AccountDetailList")
	public String AccountDetailList(int accountNum, Model model) {
		Collection<AccountBook> AccountBookList = abs.AccountBookList(accountNum);
		model.addAttribute("AccountBookList", AccountBookList);
		return "Account/AccountDetailList";
	}

	@RequestMapping("/AccountDetailInsertForm")
	public String AccountDetailInsertForm() {
		return "Account/AccountDetailInsertForm";
	}
}
