Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B400C28CF49
	for <tools@linux.kernel.org>; Tue, 30 Sep 2025 21:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759266145; cv=none; b=sYxFpewvpNNrU6uk8O+AZh0OQNkV3TKW/rEaqAOVRwbV0dwS00LFqJ5aw64K2zMOICnWI/+5scGqpjCdIytJh4JIpuBcvfgrDLZqhQgQmk6gI0oHtaX6MWTJXhN6C3VFDxsnPBL0r8/aJrxhhMMaYVkSFJUgqElm9zGygTYvYSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759266145; c=relaxed/simple;
	bh=iTJ27C1sbnlvnhPcSfLmVKHenSsyNIlzs2zbzmg/4dI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wa2dDMFEsrhNp20M0t0ikGabpH4uN4paZF53oTFC4BWvNZxlDLehQ8wkYJ21d8f1MTq88s9L+831zqd4TDodbRkWV42jTEVXFSSr3cLNKUxsKp8JG6mk4LCw491WWyQ5q8aOdXRiT2dWAyItYY1L5/jYvlE/YdyOPU0i5LDHL4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=0H+H49m9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="0H+H49m9"
Received: by smtp.kernel.org (Postfix)
	id AB474C113CF; Tue, 30 Sep 2025 21:02:25 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B12D6C4CEF7
	for <tools@kernel.org>; Tue, 30 Sep 2025 21:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B12D6C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1759266141; x=1759870941;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=iTJ27C1sbnlvnhPcSfLmVKHenSsyNIlzs2zbzmg/4dI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=0H+H49m9W0MADUPm0SEI9pnf5F/lI45hgdud2DARhEovEehIbQ54GvZxUG0T7Ccn
	 CXL7bWdpmiTtPagjLA1c6pOmyYkhKuLj3BnZhZTpVF2dMR+rzZDTj6MNTEWiC5mkr
	 GeUbwLLw7mBwKLj7bCWwTLfGINaDnBRQVC9wjrLf93cs8uIb/20A4j2gj1DVL7IEM
	 HNEieQp7yZidK/wSAG8XNl3csdL7V7HkKC7+FVfCKkGkfHd47gawdG8tqIdkavfKJ
	 /j0U02iKAGaKvvhOHYfYizzZGktvkneeaCrzRIV0AFghE3+5HY2bTsoaulBljtE4x
	 ox81iz48rx67KTPK9Q==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.147] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MkpjD-1uaudl3GQx-00mGeS; Tue, 30 Sep 2025 22:19:58 +0200
Message-ID: <a0a4ce37-31e2-40d8-a156-d1bcc52d1ad8@oldschoolsolutions.biz>
Date: Tue, 30 Sep 2025 22:19:58 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH b4 v2 0/2] git_range_to_patches: add git options to better
 represent renames and copies
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
References: <20250812-format-harder-v2-0-53f74982079a@oldschoolsolutions.biz>
 <20250930-misty-tarsier-of-emphasis-3edcce@lemur>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250930-misty-tarsier-of-emphasis-3edcce@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Drjo/MmvnHoVllKEZqrmSCUobIiOE45y1dIZ46Swm74f60bKCOZ
 HDKYQ1bXjQmdJucPI8gIzTyPoWW16Btc+wZcLFMHFFg26hQ24Yg2vHIlrLxx5HbgERpExfL
 emMEqnsDfhNnkINhX9y9G6QYDxcCThh82UHcdy7OnHgHWn6tSmUIYryETV9yoMvAi/L8ltp
 GzbF2fukc7S/euGSneV6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yiFpzhwEL2A=;kxf6rTjvifFZOCfU1QtB6jL59tM
 dqtr+K2WH5XIgkCSwk84F6jnA0YDiRO4tyA3DXyL0S5/AzYxowb738YEDeamqs8pHk+aBJSQG
 KjC+TmmsYF/9OHZIUYEwP2k1e2Vuh0JGSTun4OW84fwmLeM06IZ8G1VoqVvtk/FVCyd0tfwJF
 C5n7rhq3wpYgDVUq2tH7DJZHB/bbyCEDPOVJTK7CqrA/KUkiEnIZnByvE6SoC0EP3Ng2vw3ky
 v+xBbI1x2XuSTlkyULICHOOWLey3VU8NlQWZsxUQlUORVQd28fab56potEfmVuiLq7laxdX/M
 cOebWUEH8U7GQd5rlf4HauRJOYUmh6ORagZA4GXPNNcwAXQWZ4kU3Z8Cl27myWFxqdfH7AaSw
 i4EPk1Ij4VNZZ93KKFfNxkEVXd0qoSnBkXr8WdOQ1JDwfFs47nEMgda9ZBAsqiBAL83sOQmRi
 hTMKY2M4/HuWQDnAjO3sBIRGyMQZELW+RXCjb6HA58Q504+IPOY+b2AwxLelJrTcIowt1J5Ay
 MtACnitxLByMzHNBSvWeGiw1hM/zSRGIHobczRzIqbb2QZSU5PR8+pCjZJ2vbpvGREha0qNmv
 XPYiVM2ERRVl+83lIfwm6As15iRMEmMLjTsqLlwCeWsU2tUQz5vX7khGrLuMwkKzVGRW/cTYd
 Nkbz0OfKiORVnmu/JMHKAWp8G+IKrjkmeD9CWMfH9jWdFOQ5o5eZDZq2KORbFIob9Cizw/kQy
 Z+rgzoTi66URt5oxB5uoQ02iz+qHvryZf/yAaX3tgSiDuW5KH7hMYU+jrrbfj+HMNZseGZDW9
 O/kTgo3naM0g/t/OOuqRwQsxCY7MgrNB/d7DfPqC6tDHzA2UV9VIyp3NXoJb1kIY7N7e0A/n8
 PsMad26lXf7oTu1YDAZbrqdNFp3GbPK+U2VNe9rUz6x2yLhZEikk+eYJbHgoD3JJlGgfS7n02
 rEK4AG9Y38WN+JoP8Z5OVJ+24sp1JsWTlyfzpB+mmetdWJK8hFseFz+sMJBsIngnz0rtPWTau
 xkRP2fEl7taQG6Z0bzFMyTfVmNmH4W3+IAyZvcX3WHMFw5695BlY6nJ5a0wlNdNUCyjXUBaqY
 0w1D6Nkza13CZvCSaXIGeEE0rT2b2S11OGqXp/YpBpZquo9wfHFomSarawzW1P/DP/0rstIAe
 Tvw/c4BEiBHDdzhDxBGmtEZRyTlUgV2HB83v4OvtIjybnmNhYQzhHwpuavl9rm7mMRxe8Hz7W
 c6PHLSU4DuZ0c8hNktsY7Pi7x/2fJOoo45tmg7vuf9cdXs1Q5XLQo+uGbX7QqRQT/FW+W60sy
 BQsC1+NESwm+IhSzGXYKOmLcWBDES/ePntTDSwecn8OUW2HVQDKJcKy+iiO9huQsSXmJ9PRvh
 v0f9/wvFSEHGq6jVweRIhummcsrZcP08O0Jn+O9VlDa6klQAtjEQ0nrDcGx/fxoP47/Kcjp3K
 AyVGcBDRCpxx1vw4Ie6h0rRYl+N1HxJj+c+8M9fArbhWfqvfCaS7+gP8rD2KcCRRXsa0hCzRd
 SzqThl/TDZkxR6dZgWztUYWZhcWyZ1owGe/jTyPEtLgb3I2CSL5sT2Zwj5H+enp5DY+6HZmat
 vQ/kaxmWFx29oBaNLRYXYAsN7juwB0SvCV+GxmWPPXx9N7r2rHgpwTcTwcyTraMtRujCezxO1
 brU8syiFgnm10Y/ZsHpAew

On 9/30/25 22:06, Konstantin Ryabitsev wrote:

> Apologies for taking so long to review your submission. I don't think th=
is is
> going in the right direction -- I would prefer diff flags to be set
> per-project or even per-series and keep the defaults as close to vanilla=
 git
> output as possible.
>
> There are several reasons for that -- for example, what makes sense for =
one
> series may not make sense for the other. I'll work to make this configur=
able
> per-series and then we can revisit this to see if it fulfills your needs=
.
>
> -K

Thank you for reviewing. That's fine with me. I was confronted with the=20
"can't review that" answer multiple times and dug into it. It solved my=20
issue, and with the limit to 95% similarity it seems quite usable.=20
Per-series or in .b4config might be viable.

with best regards

Jens

