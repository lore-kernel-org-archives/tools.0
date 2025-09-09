Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E7F31D360
	for <tools@linux.kernel.org>; Tue,  9 Sep 2025 20:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757451066; cv=none; b=hYsjeiBJpayGVAoLgHdmWDY7gBpeHbupmMiosnMgaMqNzHah+dlxDSZi9+ybjAiJCGDLTVSIyaIAM7NuUE2Sq/no5iwbwSx5S+1F2qA2WFEapKD952kcutW+TBx0216t8SoZBZYUIhS3nXZw/OO7ogozFNs7GizC/gq142updpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757451066; c=relaxed/simple;
	bh=HZHu7yGJNLTKXDVi11ff9sWxSnodtFdtNebxK9WNHG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aegWq6GE48/5MjcyF3d9HEB3CBW6wg4k9fCuSAbbbWD/q4zrLt7pb6mFgbU3NuQcAcWDih0Wnz+peBa7gkBZHqIYVQt79ifTWj+7QH7cBFMNAmnig5ttXasVnHhyxlLvCeHDnwNC9hnzfo7DfXDp7uH/x2HCTvtTjsmWA9OGcdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=inamo.no header.i=@inamo.no header.b=TwORGWAb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AVutEmmB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inamo.no header.i=@inamo.no header.b="TwORGWAb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AVutEmmB"
Received: by smtp.kernel.org (Postfix)
	id DC974C4CEF7; Tue,  9 Sep 2025 20:51:05 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9237C4CEF4
	for <tools@kernel.org>; Tue,  9 Sep 2025 20:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E9237C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=inamo.no
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=inamo.no
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 02DF4140009D;
	Tue,  9 Sep 2025 16:51:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 09 Sep 2025 16:51:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inamo.no; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1757451061;
	 x=1757537461; bh=bMO+4Zj6okKDdKHCe/MD6LLCH6rN7NKUWZMIEL3/GU8=; b=
	TwORGWAbf448xQnfMhZI4EsSeCLjnw3K1aUIsYolA0NeRbTTtvIPlo38e3KofJzB
	s7vDIGMz9yD3iDLaf1mpFHmNg/mtiA6TvTtAi0QQCrdQN3u91TTZyKmB5+K1QFOV
	XsUfqdaygnvXeUTCHYFbLarcYvUfDDl/ULcx8q5Xepg3JeNDLiG60J6u2mc+A6nX
	iV3aRwZr4YuzrX5zGUFBSTPLjclgxPNS4c4mqLoG/w0JRWUwKkIcpL/Phe7aN6Ih
	jHDtfeUtbyQX6bNlNGuj3Ugzv5LpzVGOoPx9RHhSHSkER6DOdz+uVESj4I8Jh1Fi
	cf+Ui0XPvCBBofNxleM52g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757451061; x=
	1757537461; bh=bMO+4Zj6okKDdKHCe/MD6LLCH6rN7NKUWZMIEL3/GU8=; b=A
	VutEmmBriK6J7cdWEIbKQaUbb1W6b6NZuvWGVUeFoTYhJEvSaT1r5UY/gVW/TSwc
	kNhAtI6VvsYqimKhFKRSrmT7c3Mo/2t5l7N9CBYwLkL0YTmTMmEpyJELbVWXdfE2
	56IN87dTIGECriiqTNPBE40FoPceWwY6MsU+yWbM8fw5NhO1ehvJyMpKRtzMa8WJ
	PmE+uqJZ/UgM9SzdFrLnh2exNFXXFrugyI12PObicUvJndDbPng7aGzvyKRPBmjV
	HYfEmxBgCp2/gFLV0KiaXtf+AK4+UQ+GawpKd0RGCePRtwcooFfJLsE0i/eP5Qd0
	KAswgqJqXrE4bZpvM8wTA==
X-ME-Sender: <xms:NZPAaI98kqcnxZHAjaiYBLyvxhblGgwwP42pG8S4IN8mN4FEIMGdzw>
    <xme:NZPAaLSQBTkOktZAZfmtAY0Gaas2hvEu0SfCTt01B0sERkq84bVqMRV9wSvYYKNqX
    0kq1xubTMnbrMXIBNg>
X-ME-Received: <xmr:NZPAaKlicJ4zH-Rdd16RbQr5yP3TQ3sTdAo7pXYX3bjiI9uy6pGKBYxRi-YfPgORBXuRv1VXiMImCqSJsKJA3zyXRdCpaRvl0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepvfhrhihgvhgv
    ucfnrghughhsthpplhcuoehtrhihghhvihhssehinhgrmhhordhnoheqnecuggftrfgrth
    htvghrnhepvdekfffgfedugefhkeefieettdeggeekueffveffudfguddvvdekjeekleek
    heffnecuffhomhgrihhnpehhthhtphgtlhhivghnthhithhishhnohhtshhpvggtihhfih
    gtfhhorhgrnhihfhhorhhgvgdrihhtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepthhrhihgvhhishesihhnrghmohdrnhhopdhnsggprhgtph
    htthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkohhnshhtrghnthhi
    nheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehtohholhhsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeimshhirhgtmhhpfihnsdhsrhdrhhhtqdgu
    ihhstghushhssehlihhsthhsrdhsrhdrhhhtpdhrtghpthhtohepthhrhihgvhhishesth
    hrhihgvhhishdrihho
X-ME-Proxy: <xmx:NZPAaLQNi51AWNl4pBtYp8gi1cf1S1IMEZ0ND4T1nFKBvgE-zf1Yxw>
    <xmx:NZPAaIPbCguaj66ZyyP0_vYI9pULRXrOM_xhm7qWqkbiHL1_d4rUOA>
    <xmx:NZPAaEU8hvMwvEWwYna1omF2R2huTp3TeMLL1sAZZuW7qisPirD1KQ>
    <xmx:NZPAaPeNFsuvNJAMaWUQPQCMmdGo4vLlmxfA24qo3g9YJkzc0rXESg>
    <xmx:NZPAaN533aULSQ14av6IqiHLnGIS5D6LeDOhtnP8IQDKQBlHbJVpAcjU>
Feedback-ID: i6cf1495c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Sep 2025 16:51:00 -0400 (EDT)
Message-ID: <bcd4c860-3036-4b62-bbbe-a8d5b1c29d6a@inamo.no>
Date: Tue, 9 Sep 2025 22:50:58 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC b4 0/3] Support for other public inbox forges
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, ~sircmpwn/sr.ht-discuss@lists.sr.ht
References: <20250829-sourcehut-v1-0-8e259603352e@inamo.no>
 <20250903-amaranth-mayfly-of-glee-fcc42f@lemur>
Content-Language: en-US
From: =?UTF-8?Q?Trygve_Laugst=C3=B8l?= <trygvis@inamo.no>
In-Reply-To: <20250903-amaranth-mayfly-of-glee-fcc42f@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03.09.2025 5:06 p.m., Konstantin Ryabitsev wrote:
> On Fri, Aug 29, 2025 at 10:19:41PM +0200, Trygve Laugstøl wrote:
>> I really like b4, but would like to use it against Sourcehut. Sourcehut has the
>> same "public inbox", email driven cooperation that public-inbox.org fronts.
>>
>> This series adds support for other forges that support public-inbox like
>> email interfaces, Sourcehut in particular. I'm submitting this with the hope to
>> get acceptance on the concept and feedback on the particular implementation.
> 
> I've considered this several times, but there are many places where things
> will subtly break, for example when we try to issue xapian queries against the
> defined location. We really do assume that the remote is a public-inbox
> endpoint, so when it's not, we may fail (and not very gracefully).

I think saying that the public-inbox API is the one b4 support is fine, 
but they have some really strange choices in their API that I hope we 
don't have to implement.

The two main patches (#2 and #3) really just make b4 a better HTTP 
client, it is not specific for any forge. It would be neat if those two 
could be added in one form or another.

For the Xapian part, if that is the query used to find related patches 
by patch-id? On Sourcehut that matches the currently supported fields 
just fine so adding the Patch-Id: query is no problem.

Another option (but quite different) is to use something like Mechanize 
and actually use the HTML forms to submit and find links to mbox URLs. 
That would at least make it easier for more than one forge to support b4 
and should make b4 quite more robust if the API changes later on. Just 
an idea, I've used that technique with success before.

> The alternative I would recommend is creating a simple wrapper that can grab
> the mbox file from remote and pipe it to `b4 --offline-mode am -m -`.
> 
> Would that be an acceptable option?

Certainly possible, but I would say it is also quite a bit of job for 
the users as they now have to download even another tool. Being able to 
use stock b4 with some config would be great.

-- 
Trygve

