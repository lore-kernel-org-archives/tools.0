Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28DD9443
	for <tools@linux.kernel.org>; Fri, 17 Jan 2025 16:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737130818; cv=none; b=DPU9xgycMuMW52XE/Qf0Or8QrxV/fqI86t7ET1i3bmV2qkRlKbcAqezsbSEwSGwx3eswZI2pqrWk32SEnZiPDZWD0h9gd+Yg0w/oo+SfZmSoZOqDRBkCBYjFiswmduh8/2G1/voroRo4C+hT8vEgnEAcBXg/4fXmO+/uqDMfFfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737130818; c=relaxed/simple;
	bh=ntZ5mUKUgQh/jlP1L8pK2f6Odp/MBIYlMlQzPT0zd7c=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=FiQ4sSbQYg/Ukh/WBhS5H1z+R4ywwQcfgsKIZKjfk2lV4p8I0B1WnIqm9Xw0i/+R/lv4i88yvNvMjLsx3ypvQkStnJ6PqE913SBaYB9Qm70ysrterng488sDH9/E2Rk0ClcoYLkPz6wZcDCTseOAR5x5CXtr3Rj2/4XtMKNLHRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com; spf=pass smtp.mailfrom=pobox.com; dkim=pass (2048-bit key) header.d=pobox.com header.i=@pobox.com header.b=boZnlxvY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I3182bfj; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pobox.com header.i=@pobox.com header.b="boZnlxvY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I3182bfj"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F39191140161
	for <tools@linux.kernel.org>; Fri, 17 Jan 2025 11:20:14 -0500 (EST)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-03.internal (MEProxy); Fri, 17 Jan 2025 11:20:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1737130814; x=1737217214; bh=wTRMGsQbFE
	qBPZ6P/Q/BWlTC9QeAC+YKiTwWzKNQ89w=; b=boZnlxvYkIb2Ip6vkhTBrV24Nr
	igryz8HWiWxgCHXCX3xKYit8l/QDWqFpYXdiUk0NeE/7Pc3ukzY8Mwsu1vXpj9XI
	Y/POE7/ggMzW1sMvH/i5tnUEh5/xFcUjDg0COlCGEHNvNwkD2048Vnu3B4B4t+4/
	NwiDT1vVe4BmfoLXQsAmtZkOMciB5Io3AK1WAtpDKI+gyTQtDfMTE8tOe7+bp3b0
	GnFWrVKgCzB4YGUiIX/x6fvJx/kXdXOlE3hkd7mfMvY/BljTg1T4PsnDUDSroGs+
	C8C2LjNLPKx/w5KlwkU241mhoNTO/8Tv9iWZyATBlrqw3bWNQvoTFduhxDZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1737130814; x=1737217214; bh=wTRMGsQbFEqBPZ6P/Q/BWlTC9QeAC+YKiTw
	WzKNQ89w=; b=I3182bfjB7EgoNQ3TKogDBIN0/4JEr1gIPzsnsf8Mj+5DNsJYV0
	WP+H4qErMBsSqZVmBPcBGnZO0J4N3Sij1b7TYZ4K3PXdGRpt2a0BoK2Lc8r/7BDo
	rLkDDi9ueY4nf034DFPwhEx+LG75RMbA9uh0K830b8dX/9IoTCUP7RvHIJHL0Qvu
	/R/ccgBNlkArECjQFb1pTl/nMJ9GcFKeOrGbXVbuezRwK9t4A/IVU+hY3rGIgKLd
	/Ds5U9pqXapGywEbNMqQdvN1lVqY43+SUsKhBF/zvI3lNzRBjMj+3LM961LP8Hx1
	nJMlNtn8J+6Kta17UnmB9J5NJLmQ55/S0Xw==
X-ME-Sender: <xms:PoOKZ-kzSZJta33dtWuLuGGPChr_F4V5_MW3DeQcUCx4ZM-kIoIWqQ>
    <xme:PoOKZ12MkD5YLqCEZMbOWbbeECa51BGHb06eHkyWwAHDNB9lohB5raH44V-UWsdbz
    wjrPTPrtGdRY2XFBKg>
X-ME-Received: <xmr:PoOKZ8qpw4T9uIvjwhzZi77s4f4_nfXYyx6QTPTwq4HBSC0yMjJ9LA-zFYiVvz-ss53ex94VIA8WftjpZwIuAXuLklDqiZwY1c0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeifedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfg
    fvhffutgfgsehtjeertddtvdejnecuhfhrohhmpeftuhhsshgvlhhlucfjrghnnhgvkhgv
    nhcuoehrhhgrnhhnvghkvghnsehpohgsohigrdgtohhmqeenucggtffrrghtthgvrhhnpe
    eluddtffffuddvueehfeeljedvveejveffgfduvddvuddvudejkedtteejgfevleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrhhgrnhhnvg
    hkvghnsehpohgsohigrdgtohhmpdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhp
    ohhuthdprhgtphhtthhopehtohholhhssehlihhnuhigrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PoOKZykz9kiSooTl6NWPfk2zzIxTWQMfqqQaR3ZY8pKyqcAsjWOJSw>
    <xmx:PoOKZ81i2jYS_IuNTXj7RFhdWLidUB9Yfh29pY58GjteMylGNsUbkw>
    <xmx:PoOKZ5vbouuXCDj5nfV996A1nc9TxezDTQpBAAQ0pVb0f-sbpW5FOA>
    <xmx:PoOKZ4VUJvVUxFfTlEEcoWN2vB0v5jGOsQIqCFO9B4NtR3cmOLx_dQ>
    <xmx:PoOKZ58ax0i7ATuPc7TISeisxvQv6HjvXfjjGmbq91RNkbbAVSU0TlMk>
Feedback-ID: i0f414978:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <tools@linux.kernel.org>; Fri, 17 Jan 2025 11:20:14 -0500 (EST)
Message-ID: <bfb0c080-da20-490a-8124-799f2e9a41d8@pobox.com>
Date: Fri, 17 Jan 2025 11:20:14 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: tools@linux.kernel.org
Content-Language: en-US
From: Russell Hanneken <rhanneken@pobox.com>
Subject: patatt validate does not recognize patches sent with git send-email
Autocrypt: addr=rhanneken@pobox.com;
 keydata= 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
 QTo=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Files generated by git format-patch include a line like this:

 From ee960a46b08040dd0fc154d2d0c4e2026ff817a9 Mon Sep 17 00:00:00 2001

The format-patch documentation describes this as "A brief metadata 
header that begins with From <commit> with a fixed Mon Sep 17 00:00:00 
2001 datestamp to help programs like "file(1)" to recognize that the 
file is an output from this command."

However, git send-email seems to strip this header out when it sends a 
patch by email.

When using patatt validate to validate a patch without that metadata 
header, patatt exits silently with exit code 0. It seems not to 
recognize the patch as a patch.

If I manually add the "From " header back in, patatt validate works as 
expected.

Is this a bug in patatt, or am I doing something wrong?

Regards,

Russell Hanneken
rhanneken@pobox.com

