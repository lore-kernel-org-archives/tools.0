Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD85311941
	for <tools@linux.kernel.org>; Mon, 22 Dec 2025 09:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396215; cv=none; b=PqCSPG4/7JKKCbhKQ+bsjpkptUDDru49xGeY9MmWkpLpS8J1Qotx3SmwWpqdqxGpYv3vJhkf/5p7oLUVudb+8ZJwYoLgv24acdO2AulboEO+rK8jfdXb3Qbwy52Kv09Diu7im6myudwTBGHiLGosXu+S0eRO6KuXhveF09iil/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396215; c=relaxed/simple;
	bh=HkhjCZrne7qQJahedWxiCLoh4aOir3xN7KC94v/fQ40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHv3Kbs9HncotpVI0SO6myR9Lob0/L7tXJot1IrVWA7KwSjWMzCNIA66Y/jna1sHZdN+P5gRuU9jsVRyCD7QQVw7By3lR1xqqfAKI4BiXl/yUYtdF1hORquU7r3XlfRT3h/bf8dEuOBVCQtZ1qINXUJ/pFLTONxhftYLzwjhzwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=FeQN+0iv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="FeQN+0iv"
Received: by smtp.kernel.org (Postfix)
	id 60BF1C4AF0B; Mon, 22 Dec 2025 09:36:55 +0000 (UTC)
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 440CFC4CEF1;
	Mon, 22 Dec 2025 09:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 440CFC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766396164;
	bh=HsbEwL+a3ehQwaqo4UIyfPjDh/hFR3Gu+Q/uCtPiRcM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=FeQN+0ivvzkZvaMy2YHQO7aBztQanzf01RZheYchbmsZ3KefH6IUtP+u6gBpaEIFD
	 oEqpS771fF0mK+wNMPJbUjfEelNpJRcixXjD4gyIAuG1AH1TTVYBXTsF46AUDD01Xk
	 n3pP33SbV6eUGWvtOtf8Qr9sINXowTPUZ/oiMKYc=
X-QQ-mid: zesmtpsz4t1766396162te0c85235
X-QQ-Originating-IP: rk4yZ8PstRgyj0RWzoU0G3baXYfMJuIshSlWznk2Z4g=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Dec 2025 17:36:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11526639101067456687
EX-QQ-RecipientCnt: 16
Date: Mon, 22 Dec 2025 17:36:00 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, patchwork-bot+linux-riscv@kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@kernel.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, dlan@gentoo.org,
	elder@riscstar.com, andi.shyti@kernel.org,
	alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
	broonie@kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Message-ID: <5242B57B5E933BCD+aUkRAGxI5ABW-s3O@kernel.org>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <176613181654.3684357.18070317581817603415.git-patchwork-notify@kernel.org>
 <20251219112634.GJ9275@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219112634.GJ9275@google.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M2u8sn5kZ8jXvSoPKmPqxVlUuLICsF7PMKgBMBABQH+8lu97CgM3O6I2
	3eegY8p6eemlULXBPYWg4MsvYO7XwTq/KUMnu8gonrlFvE049f/FVESRhpwnRUhTgvQEAY+
	hNJrVC46dQUyRU1Ea0XnYNDN7dRTJMw2OoLYDbw6IPuO6owDvlY0ZXMIZ4B5h8qzc8eFVN8
	VBbrP3K6dA4zNRwKay9eb/C98roNVlPjrtL0vh20jTM9ai6RlHvIZiDvth8F9E7Pj5i6Y7l
	DL3oaD5jeKuBpgmH9v1+MO+cRR5eo7RvE+8EInYuBlyHgod4FdgS8+M7vXWmPPeMsOOBfJ9
	h8y0fR3lDF8PerdeTDgFtieBH+HuS6bKxw9qM7Mdmdb34hpxVEMOylLspj+w/mHnap1qmWj
	PSwBx0PqQipLkad3f4d0OFUMIqbxNcCTjtJ0QZpIA65+q17gB4Z20tr1hinyhxx43Vf/hBj
	o/MGKhgONpPkCBCVqLMo0zjZZM66Jp14MsklYmBS6g+ujo9j1NcPXc7vka+TdGb4HIqiM3h
	Jpwt+5y8SUDkG3X42j5rLFW7YhaG4lzv/s85uYt2Ls8wPGn44aulzGgnIvxjVz7+0GBS+U1
	CzHe5iMeWXSry9Cu5eUQTN5+34mo5NGEYI0AYUSwSfhbg6AgATlXmcJdE4H19pzjFxNoP/y
	4c22alXagbaXSAk3JNYzi9M4SS+5dauPUVer1ufgZM26WAVVx8j2bjraSRcEu3Ue66lFprV
	mXyxxUrL/TxI8yHTSi39GCJTPMNB18Pa0CWzIScmjlpYC3oxYPtQO5R2GNw/GxPm9mlsaei
	qKGmKbl+Dov5DEMvXlr+Bm3u3OG3rK0VGN+k4UXLI7wVVmzxZo1fGW9VmiOMEy8h8S+VLz9
	6G2IGww9AuvD7Tc5eEdr4+fqCc413d2qYeVaHBOX2bIO+vOnybxYDBjmgQnxNo7qsFqYCav
	O/h7fmdiMEainLQiC3PLOLuh9Jui/4UjWDXke70H0u1c1Yw0r+qtzJjkDKGuBfQPuy8tUaW
	xt8bZ+RRjyMYwx3j+n3OsDDS+ZY8EhQl7IrP1UEKC3ogGC623C/Gyy2Zk04G3nfgN4ivtW7
	VQBoL7vvBNlUEe09K+4krMBFH1xA7/haC/1cJ7MsXdZ
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

On Fri, Dec 19, 2025 at 11:26:34AM +0000, Lee Jones wrote:
> Hi Konstantin,
> 
> > This series was applied to riscv/linux.git (fixes)
> > by Alexandre Belloni <alexandre.belloni@bootlin.com>:
> > 
> > On Tue, 18 Nov 2025 14:08:04 +0800 you wrote:
> > > Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
> > > merged, the driver would fail [1] when COMMON_CLK was not selected.
> > > 
> > > This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
> > > patch has reverted by maintainer [2]).
> > > 
> > > Now, P1 Kconfig patch has been merged[3], so I2C ILCR patch can be
> > > merged as well.
> > > 
> > > [...]
> > 
> > Here is the summary with links:
> >   - [v3,1/4] i2c: spacemit: configure ILCR for accurate SCL frequency
> >     (no matching commit)
> >   - [v3,2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
> >     https://git.kernel.org/riscv/c/16bd954c9336
> >   - [v3,3/4] regulator: spacemit: MFD_SPACEMIT_P1 as dependencies
> >     (no matching commit)
> 
> >   - [v3,4/4] mfd: simple-mfd-i2c: add default value
> >     (no matching commit)
> 
> I was just about to send another snot-o-gram about people picking up
> patches without the correct Acks, but I just realised this is the same
> Patchwork issue we spoke about a couple of weeks ago.
> 
> This formatting is very confusing, since at first blush it looks as
> though the whole patch-set was applied.
> 
> Please can we only list patches that were merged?
I agree. At first glance, I also thought the entire series was applied.

                          - Troy
> 
> -- 
> Lee Jones [李琼斯]
> 
