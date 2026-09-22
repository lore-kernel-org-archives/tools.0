Received: from send124.i.mail.ru (send124.i.mail.ru [89.221.237.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591714AC16D
	for <tools@linux.kernel.org>; Tue, 22 Sep 2026 20:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.221.237.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107335; cv=none; b=sqbV1Z4mGt3CP5SVAkBfRMtDt/D0NHBPBm62zE5tkFBUFtjc+vHrdWH4gBHO0CYYBSkemyADDuPAzMgaByaxlVpDisG64PAlkMnJzT8NPSvwwEHSq6IPFThEOQKi13H5upj+heRGaPge5l+gInsvkmqsTybIUES5jY056cm9lM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107335; c=relaxed/simple;
	bh=NRI1KV7ljE4mZNtkipVMPG0RgesVfvbvHGW/q7DFe64=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=XW32uJR9L9YWXHHb1/D8BM6v89JTpDmXwcOZKSAyrxjAH0/ezBHXZUVNZjp8sKhhwopNdbPDT+UFu9z6GXg8UxaWMGVtHPTdLyD6SQMDp39UxgSL4NvCiHbHx5vMW7dB5GNXd9Xivp2X6BSqqfdBAIbmDgB4wQXW+GB2SCn+EjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru; spf=pass smtp.mailfrom=mail.ru; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=GGVXxYfI; dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b=GsHNQvhs; arc=none smtp.client-ip=89.221.237.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="GGVXxYfI";
	dkim=pass (2048-bit key) header.d=mail.ru header.i=@mail.ru header.b="GsHNQvhs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=Ep0idmvhbhypSc5+nQDJa1hJJK+5f1WcKl3Ogg9YVIM=; t=1790107324; x=1790197324; 
	b=GGVXxYfIZmhk0LcMmZS2EpI/ZS+OWs8LrXuedzUuZzCTbNrKknICybvBu48ULCcrtPUfiHAmb6L
	kJC7aU1MF86BTTdkg7bvmdNN+6Lfnyzur7G79SkpHyn9tUikM+WnsEZqTfKGy4GiJliS9tKy90/QT
	WfDBJMag0hwq1ae4LuvgZB8gIwB1tbtFCfn+aloNVL1SXbxc1V6zFQgk8iKdlRL6wLwfY8/aXFX5k
	JkoVpwrHKumWGHIewuAT77/AOFn8iIIdH4Or/oHRay3gX21MSMFige1TuyFk0NBLr9Ek/4OALloDT
	rB+MJkdRM+zzl+1Xw3uK5IP059rrXtc68AvQ==;
Received: from [10.112.216.212] (port=35212 helo=send217.i.mail.ru)
	by exim-fallback-5d6c5f48fc-smzh5 with esmtp (envelope-from <aleksandrlugeza@mail.ru>)
	id 1x96S1-00000000Sry-1iQx
	for tools@linux.kernel.org; Tue, 22 Sep 2026 22:46:49 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	Message-ID:To:From:Date:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=Ep0idmvhbhypSc5+nQDJa1hJJK+5f1WcKl3Ogg9YVIM=; t=1790106409; x=1790196409; 
	b=GsHNQvhstPZsi9iuJIkvk1q9lwThluepxD1E2Cj7SuAdCkUAM4Ic0CRa4a+GulYgLN9zdeFJvTz
	qyM/2SH2FwzCcYjhNWHItLtQhDIr/RroZsG/BKTxd8DNeat6Xp5rasr5EslKuwQNdUdLX9aoRdt+7
	wRELWyimUuIStMjwdPrfjhR0gyaIeHh2uoF4rRqRniciEUatDHPo5RI1bV5LEqkeOR3LzLFUhUBcA
	OXGuXx/Zr0pZj9BslFXvE8+z6jwUmrNaZI3SxWifLryO0imJuzF1ULit1GJtygnWHZAc80bHksPkV
	Wqfhjm2k4OTi0kGilMmzToGZ/XJXQbCAckrQ==;
Received: by exim-smtp-7cfc745659-g2hv8 with esmtpa (envelope-from <aleksandrlugeza@mail.ru>)
	id 1x96Rq-00000000HDB-2SSU
	for tools@linux.kernel.org; Tue, 22 Sep 2026 22:46:39 +0300
Date: Wed, 23 Sep 2026 03:46:34 +0800 (CST)
From: aleksandrlugeza@mail.ru
To: tools@linux.kernel.org
Message-ID: <1534240355.5919.1790106394524@811b6d7f5e3a>
Subject: Regarding internationalization support for your settings project
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9F6609298D81718F479E199F10B546D4E47E26757F7C2F9F4182A05F538085040A901DE3B434738893DE06ABAFEAF6705C1045780895123916E879759B09798AD784ED878CF4C7D9C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72E4E5201E1C2E308EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371D5B197C6EC5B4BE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B2047058F48C6CFB5E2E070BE324C7D3C4A56EE0C32783D9F0BB0A4F435E46E6718B35066C979671628AA50765F7900637FD2911E685725BF8389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0A3E989B1926288338941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B636DA1BED736F9328CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8090A508E0FED62991661749BA6B9773595E8F3CEB8A9C263CD04E86FAF290E2DB606B96278B59C421DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B67D57246285A0387175ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-C1DE0DAB: 0D63561A33F958A5A9A66DB7556F2A595002B1117B3ED696B83B5319CC5690E892212597CCBD6D77277AA237ED671D4372AF3B35EA4094CC6089696B24BB1D199C5DF10A05D560A9D2B5782620B851B7C8C84E951CD0BE2F58C12E6D310A6D53EC1C9C6CFAD2A0F5A71A35648BE338CEED902CAAD3CD6B00BA7CCD254A1CF5E8436FBEA07416C40E638A446BE3E5C627BF0CFE790FC11A7261332C5CB50AE517BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB774242A1950755802D361004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D344EF254DC71474AA35FA4E9E164ADC637A52C36D0F6CD89B5B8B954BD154971C59A915F43169A0FB71D7E09C32AA3244CC1ABC3DAB2D5C16177DD89D51EBB77429FA4C902A8BBA299EA455F16B58544A2C99F59F2F009F096E57A8CE2CFE77B91907D42A1D517ED9C6288A4F1599D2E4D24A389F0E278DBF4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWJYnLc30Yn2KOphDQ8QPJMA=
X-Mailru-Sender: 8D5A85702CAFC9B9C66BA6B04FC363A75A2DB860AF7E938749E664013E0E01B129DB3C9B15B9CCBF6813DC686C5F4ED566C0896B222A4FEDE0F2626FFF26911B7ABA7BBA69E12FB7C1C3AA6B991890AEA0623B7364CE82DEDFDC0D1D1BA439196C0D0AA063257108C77752E0C033A69E3453F38A29522196
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B462E89913BE0CC0C41C5F3851C84B68F7D2F824CE98A7BB5A049FFFDB7839CE9E01830AE2280515718A800D4791441CF149BB493F46C497C49FFAC1995BDC3D92369155B54C2D779E
X-7FA49CB5: 0D63561A33F958A5319B7B4D271229605002B1117B3ED696644A85E84D5F44453D1B8CC3424EAECF02ED4CEA229C1FA827C277FBC8AE2E8B54F520D093A0DF28
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpLaIlvAR6h4id02YH9mgeCTAyYoNlVO8a0sghDpFdyhxd2wpMnF7CO8=
X-Mailru-MI: 80020000000000601000
X-Mras: Ok

Hi Sean Christopherson,

 I am Guan Leiming from Weifang Leimingyun Network Technology Co., Ltd. Our team is mainly responsible for translate.js  The development work. I have recently come across the open-source project sean-jc/settings that you are maintaining. While studying your configuration management project, I thought that providing more convenient internationalization support for its presentation page could help developers around the world make use of your tools.

 Through access translate.js Your project page might be able to enable automatic switching of webpage content without the need for manual configuration of multilingual files. I was wondering if you would be willing to give it a try, or perhaps check out our demo website first http://translate.zvo.cn  Want to see the effects?
