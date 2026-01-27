Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74BA36CDE3
	for <tools@linux.kernel.org>; Tue, 27 Jan 2026 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769542634; cv=none; b=c105TQUSuzyflvWzGBXukNRUy5/KVuhMrHXtq8Ey9C0U2YwyVqNjvspD0qhFEBWMtotryI1HcR4E0UcVv0y3kLG5kFE1ArD5I6NNnJnvZctnevXp6ESR9mnXsTeyEJpzlK2z/EHk7lS6uYAB6a1xC53id+DNCeR3zkjKkyLxTUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769542634; c=relaxed/simple;
	bh=3jKaTBylGjOB9ThV7XO+mqHa7R8K+viBWQcwcMBDJ74=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ftNZ62Kp99xdBz4Jw9zHa4GsV6wG6DPgCyyWxjKiHC8TfThJMt8ixhyPQov0Qiuz0nMrWka3bqXBN3jnKCMh9v2Ie8y/R3aZEJWNo+nZFzzKCGW7w5jLboMm9FYnypFFqA6DwLxsf+b3tZaOZ2TgyqPZ/CDjv+e1qtzqkg7DXQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDoO2Qbu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDoO2Qbu"
Received: by smtp.kernel.org (Postfix)
	id 8C863C19425; Tue, 27 Jan 2026 19:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3CEC116C6;
	Tue, 27 Jan 2026 19:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769542634;
	bh=3jKaTBylGjOB9ThV7XO+mqHa7R8K+viBWQcwcMBDJ74=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=fDoO2Qbuzwg3HY183QevKnET79fDNpKquBxiOXy5kT2yFGBGFwCQQC2sF5+91E3fg
	 I1b9+3HueLOxckj3pyIfTPROjzj/VRWbP8LbuB8auwktxmFuYZkXCMKBo8gzLjVWpf
	 f1njJZ1hz/+z99CgsKZqb7xgp5dFaoE3bpTTvCXSGP89KPFdTas/sN2p+4jlR6I0yv
	 QfIiju2bQPdRgx3E8qvHaebfD1DyN9qzRcKGwDeWoXiEVJ/WLMgTXtpBAPOmmC4439
	 9cr0hgAq2TN2htAkeffi1/oMPe88jbe6ZwOiSJzTOyfbsNVt9nkccCeQgfqMSyLgsr
	 GhQgqOPX/9cyw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 40BFFF4006B;
	Tue, 27 Jan 2026 14:37:13 -0500 (EST)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-01.internal (MEProxy); Tue, 27 Jan 2026 14:37:13 -0500
X-ME-Sender: <xms:6RN5aaZPRSWJwFZGN88i7bqMg5BJoWFXTz7LPW3CWU-UqGkBBQHlFQ>
    <xme:6RN5aYPhqGAhypUFlmxBqxH3ihP-AsR4OqvNsSftYURzlsFtnu1-ZJ_h3krolRFN8
    9EoAf5IabtmeAnTm3nyuEqFZnWpS2Q8C18fBr6gy90usQYOQC5EsBZl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedufeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvffkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfmohhnshht
    rghnthhinhcutfihrggsihhtshgvvhdfuceomhhrihgtohhnsehkvghrnhgvlhdrohhrgh
    eqnecuggftrfgrthhtvghrnhepffdtheeggffffedvvddvjeeutdevtdeitddthfeihfeh
    keekjeeihfdtieehudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhrihgtohhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithih
    qdduieegtddtuddvieefqddvuddtgeejtdeliedqmhhrihgtohhnpeepkhgvrhhnvghlrd
    horhhgsehkvghrnhgvlhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepvddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehtohholhhssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:6RN5aY4b5AJsJsafd-lk7lIJ4zF6eoUdq5i7pKcAuLLAk6zlmvsR3A>
    <xmx:6RN5af7uXI9fnUAUeIiqgtlnxzrBKCAeiA6OukWrxS-C8rAXH-uzYA>
    <xmx:6RN5aVHsulPIogzlUmAfhF4q2AUEapwwoNYnjudopFajh3uAVK9qMQ>
    <xmx:6RN5aYStbdco6U6z1zKzc-SV2h8Sky2YLwx6JHbA0rRnuIMxBsvvmg>
    <xmx:6RN5aev2DZtympOl2IxX_nMnS5qoZg7bSyWJdA8SQxNWENlcyYqwDidp>
Feedback-ID: i40364868:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2570115C008C; Tue, 27 Jan 2026 14:37:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-ThreadId: As0ON4nRQteg
Date: Tue, 27 Jan 2026 14:36:52 -0500
From: "Konstantin Ryabitsev" <mricon@kernel.org>
To: "Ard Biesheuvel" <ardb@kernel.org>, tools@kernel.org
Message-Id: <c17cacb3-ae34-480a-89e2-5a925e4ef21d@app.fastmail.com>
In-Reply-To: <26435143-82c8-452b-a06c-e47de6772802@app.fastmail.com>
References: <26435143-82c8-452b-a06c-e47de6772802@app.fastmail.com>
Subject: Re: korgalore delivering duplicates
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jan 27, 2026, at 13:18, Ard Biesheuvel wrote:
> - messages received directly that are also pulled by korgalore,
>   potentially multiple times if they were cross-posted to multiple
>   mailing lists;

Properly dealing with this would require us looking into each target
folder to check which messages are already there. I'm not sure how much
pain it would be to deal with this situation -- we definitely don't
want to list all messages in a folder to compare message-id's, but
maybe jmap provides an API mechanism for this. I'll follow up once I
have a better picture.

For those deliveries that we perform via korgalore, at least, we can
track which message-id's we've seen per target and dedupe at that stage
-- we just need to make sure that we properly apply labels per each
deduped message we process.

-K
