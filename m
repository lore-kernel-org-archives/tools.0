Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8452DCF58
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 20:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760386325; cv=none; b=YATZ62t6G1H168tJ57xFvbHQ5KD7T/LOPHEtfBXNcckdRVYNGWDALH3ej/qaAQrAxLaM4ZTHihte3tuJzQosZ5wae7zl+nZ05pch+xApUyVzOUGarC/QvVQpMRDN5PXtPRA12drAfLVbDlJnKS8akWGSM1Za2kJ4zUptVpEMTrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760386325; c=relaxed/simple;
	bh=VYZOVhOLli4jp3JdMIGnuWjxhh+4xT0Bpv//yjJrl+w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GVl0xagvOnDtv3pa0xsv9EIkyIydw0jbW4x1dWzwjBYqretKLxumfcIqcUSHBLenQLmnUP/CUfFam/JuvbCchipjw7jH9EsIPAR4bmPKr1t12IoKGz6YV0fVE/+j7SJ76Ps4JSLb5UqVjYyXLAcHJETyz52WV+y/bfHxYMESA6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com; spf=pass smtp.mailfrom=pobox.com; dkim=pass (2048-bit key) header.d=pobox.com header.i=@pobox.com header.b=Eke8RHyF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=huEVE5MQ; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pobox.com header.i=@pobox.com header.b="Eke8RHyF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="huEVE5MQ"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 5F93F1D0006D;
	Mon, 13 Oct 2025 16:12:02 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-05.internal (MEProxy); Mon, 13 Oct 2025 16:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1760386322; x=1760472722; bh=DQ85jLAMrP
	PD5jfCLHc23nSMy6flG0JQ1zYEAPKnkIQ=; b=Eke8RHyFrWqUl2uiDq0kxld0qA
	VgKMJuDzayG+AHPct6tcc3XOJPqFUx5is13reGEPtQrj1Wii/2PjJEQdCbNwl+Nt
	XDGYbXD+QEuGUCMv4i+/KQIVk5U0t82R++qb/NaqDAfFrMuwmi440GjjN3jxbRqq
	fGUdlJqxRJSbnb+bT+EJIgWXoHPqMUWW1VinRMLB1bmDkO8dZuoE8IpgRsAvBTI8
	/2rtUGypZ7bWmEn+PQHlyllTI2BitgztCmiV3S1qi87rIY6zkQqy5ud4a5hVmLRD
	bXk846xg3g5FQm3vVzMM+SF/8VUAypi+ElTtorGVTE5QfV+uJ23DAfVIfL+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760386322; x=1760472722; bh=DQ85jLAMrPPD5jfCLHc23nSMy6flG0JQ1zY
	EAPKnkIQ=; b=huEVE5MQdEVQCJOX7QZCjr6zPxkacPZYCa53uojP6Su6bZKGdsR
	waCvGpDgoBhTeIw5JrpMIXGbr0A8W94pgBEUxvj9uxpuw6/Igu8uQ3GxbHMyiar3
	0djpPHmE4wnbbvfEn5oLORK/ypRBcNbuzql0/cQB6sF8M4BPtzczVr9OiAFqhVBi
	iWMbnssYqtuMFa8COrSJBX0HSIBTdSb4be3XW//vsQt4vJYLdvqpbqcA1eABZfAi
	SR6INKWhQ/WX3R3z88Xyo9KE/WSm+xJ0SaQQNQIo5hSLAT1cyli67sN5JP7UZsp5
	cnRS95bhZ8vxjsizwg5tg7w06atyyV48Hmw==
X-ME-Sender: <xms:EV3taGYcCz-crku2w367qfifxM3GwENDPNA-qo6Aof8Pv8GsBWGvMA>
    <xme:EV3taLq_FHTwv7J2dUSgfVayaTN8Sk_HeHukJFuolFYiI09Mk8NN1g8xdWMmo9FJ7
    3sLN8k0X_SFCCWHkHmIATxXhetOaYDR-WzAfFlegypK3hNKMX9ylw>
X-ME-Received: <xmr:EV3taDOa0geLxWK2yaTQHuDE_9idgdBCsxZUGpwVZqFzzYkQTcplJA4ZbChqcbfWVFc29X-7d62yKSbLh-9VHN_7hwFXIQKq26iP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduudekheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefujghffffkfgggtgesthdtredttdertdenucfhrhhomheplfhunhhiohcu
    vecujfgrmhgrnhhouceojhhunhhiohesphhosghogidrtghomheqnecuggftrfgrthhtvg
    hrnhepgfejheejkeehvddvgfethfduvddttdefleeiffekleeiteeiffffueeljedukedt
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhith
    hsthgvrhesphhosghogidrtghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigfhhouhhnuggrthhioh
    hnrdhorhhgpdhrtghpthhtohepphgsohhniihinhhisehrvgguhhgrthdrtghomhdprhgt
    phhtthhopehmshhtsehrvgguhhgrthdrtghomhdprhgtphhtthhopehkohhnshhtrghnth
    hinheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehushgvrhhs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohholhhssehlihhnuhigrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehjuhhnihhosehpohgsohigrdgtohhm
X-ME-Proxy: <xmx:EV3taOrn6HpBnmfT47lngQF30fMUVjio6RTbmV03WdLVTq1PkoKelA>
    <xmx:EV3taAfP85RlzY4TykO4U-QJbu9OPHS6qkmGspf2haj3Fvcqx3rYIg>
    <xmx:EV3taMTPkLZbiq-mGB1Zh-wzOeX2S3BFjKLcl1d7hYiqNOmE4wzFLw>
    <xmx:EV3taBbq3MqW3jAVQGFC6WBgyjaIo7yReN84_36iZYaHOm5hbh_E6Q>
    <xmx:El3taDmnEfbdSvMEuYeVrifDYXUXb5bpjWcZ6NkrUtyQJIFefyh4kMHw>
Feedback-ID: i1ffb436d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Oct 2025 16:12:01 -0400 (EDT)
From: Junio C Hamano <junio@pobox.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
  users@kernel.org,  tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
In-Reply-To: <CAHk-=wg4WfbXs-kMOAM7FmQ0w8q3KO9DC8CWLg1WPnoaZW-Wiw@mail.gmail.com>
	(Linus Torvalds's message of "Mon, 13 Oct 2025 11:53:11 -0700")
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
	<20251013081536-mutt-send-email-mst@kernel.org>
	<CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
	<CABgObfZS--70UTOpSXo=JOZViN1jm4O6M92pu-6Qunif3v1Y8A@mail.gmail.com>
	<CAHk-=wg4WfbXs-kMOAM7FmQ0w8q3KO9DC8CWLg1WPnoaZW-Wiw@mail.gmail.com>
Date: Mon, 13 Oct 2025 13:12:00 -0700
Message-ID: <xmqqy0pezhm7.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Linus Torvalds <torvalds@linuxfoundation.org> writes:

> I do wish more people used merges for series and put the series cover
> letter in the merge message. Now *that* would be a real improvement
> for bigger series.

Perhaps something like

 #1 "git am" learns an option to apply patches [1/47], [2/47],
    [3/47], ..., [47/47] in order, and then [0/47] as an empty
    commit to record the cover letter on top of that series;

 #2 "git merge topic" notices such a topic capped with an empty
    commit that records the cover letter, and merges "topic~1" and
    throws the log message of "topic~0" in the log message for the
    merge commit;

 #3 "git format-patch" learns an option to take a topic branch that
    is shaped what "git am" would have produced in #1 (i.e. you fork
    a topic, build commits [1/47], [2/47], ..., [47/47], and capped
    with an empty commit with the cover letter material, and does
    the obvious inverse of #1.

would make the world slightly a better place?
