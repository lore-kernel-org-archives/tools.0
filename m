Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2C027FB18
	for <tools@linux.kernel.org>; Mon, 23 Feb 2026 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771862282; cv=none; b=pPZKxgvZJuMjzxMgVGzhN8aNtoUhrC6gVGRLMwOYlQsFVbB7NR8U+qUgTejcdYFbkd9LVl2wmxiOLIy2LOKVue0cteB1+/PhxgvTPwLlguwjjLieFejZ4Y7QICM8+yHhHADhxtDpZ5arfagnAwZDiN4qYrhKal/DBdRCr71nb3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771862282; c=relaxed/simple;
	bh=JQS87MUJQ6T05NuEnvvbx3srY7d1b7ehLULonPAiuh4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NQre1ix5OEZL7QfWgDaMc2RBAoahKMRjQJ2qAc1BdsW1QRGeZw6Fi/ecSprsT1/Hw4erMxL5BjREL6SWLmkmiBG3QFjg64OYOAuEMH8MrkKIHRNeFPReRC3LnRa5bHEqlTu7UNUwiFT5jDTgSnn51srLY85si0NrfzGV9oHEKD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVlYrS9Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVlYrS9Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44ED8C116D0
	for <tools@linux.kernel.org>; Mon, 23 Feb 2026 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771862282;
	bh=JQS87MUJQ6T05NuEnvvbx3srY7d1b7ehLULonPAiuh4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=RVlYrS9ZuV32/298p7I7OYG89T8ViQnOoLo/wGvnsq32qSFqGl2VjCRyL74krnCMv
	 ZlTPzKJQrb3vEcBp2adYMdEygCshOR9Cy+jpA/4MMTSQNY6UDgulRjg1YwTyqQIzhE
	 r4RUrV/4dtZQ/sNThO8i6QOHw0PkhFCjfwcJbAX49c14tnRL9aaq1Tl3HQ0UfeEylK
	 noMfzWnZ0+vB3Teg1NgcMc7QX38pGo2sB3FNEMrunzLWBG9DsNjk2xypNegYHc2IRP
	 rZsroltyvtgOQgbpCy3CrkI+We6/2jLgK2/wWf0aR+vz7B65PdAoff6EYlU+rkp3L0
	 Y0pWC0plY8TNA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3056FF40070;
	Mon, 23 Feb 2026 10:58:01 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Mon, 23 Feb 2026 10:58:01 -0500
X-ME-Sender: <xms:CXmcaTns28wV9hYiJgMx4MdKHkAFeG18d3yXWyIZVw4YQZ8jaCmBug>
    <xme:CXmcaRqe-d2T0dP9aMUiGOoshveFnFR-NZu9CeTTcNtjdBJixPIs68v3b9E-TdH-6
    xvtRWsuXl_PaYHjRhiEQWTTds6fyPJsj9v7fIbopTrBlhsFRz0esVI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeejieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekvdffkefhgfegveekfedtieffhfelgeetiedvieffhfekfeeikeetueeg
    teetteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhoohhlsheslhhinhhugidrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhsthgrnhhtihhnsehlihhnuhigfhho
    uhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:CXmcaaTTzSDAnQ47mQ-Z9UUwVQtfP_5xu_-ZER-AazfN_x4qDfEXrg>
    <xmx:CXmcadu90l4KtW4Eg2BDlVT9XioInh7RHOORggZB312hQWTOnAe99g>
    <xmx:CXmcafYV-I_5gmHsm_2ORrCPBUJIZbyQKbeIfxBzdyz935ArfzMS_Q>
    <xmx:CXmcaStJvGDhJlNaecddg3yFpF7YVqcf94PwLI6ZPgMLeYZ62WKmOQ>
    <xmx:CXmcaRF8IPPdD9FPR3qNJ0UwcjCGSjMSZLN9g3RR1_tZcb534CQJ1-WJ>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0F425700065; Mon, 23 Feb 2026 10:58:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-ThreadId: AJ7eQotoFLlF
Date: Mon, 23 Feb 2026 16:57:40 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Message-Id: <9998cb18-ae38-4804-ad55-98b94af69b92@app.fastmail.com>
In-Reply-To: <20260223-coral-chital-of-vitality-a63b8e@lemur>
References: <5232d291-747a-441a-a4a9-f518352b70c3@app.fastmail.com>
 <20260223-coral-chital-of-vitality-a63b8e@lemur>
Subject: Re: korgalore chokes on rm commits
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, 23 Feb 2026, at 15:58, Konstantin Ryabitsev wrote:
> On Fri, Feb 20, 2026 at 06:03:12PM +0100, Ard Biesheuvel wrote:
>> korgalore.StateError: Commit 57b7006b98f00912504ce02ee9fdfd673d18cb79 does not have a message file.
>>
>> commit 57b7006b98f00912504ce02ee9fdfd673d18cb79
>> Author: linux-crypto.vger.kernel.org <linux-crypto@vger.kernel.org>
>> Date:   Mon Feb 9 20:28:44 2026 +0000
>>
>>     rm
>
> Thanks for reporting this. The "rm" commits are a public-inbox mechanism for
> removing messages from indexes without rewriting git history -- they carry a
> "d" (deleted) file instead of the usual "m" (message) file.  There's also a
> similar "purged" commit type used for content scrubbing that can have an empty
> tree entirely.
>
> Korgalore now detects commits without an "m" file and skips them as no-ops
> instead of treating them as delivery failures.
>
> The fix is on both master and stable-0.5.y. Can you please confirm that the
> error is now gone? If so, I'll release 0.5.3.
>

Yes, things are working happily now (I tested master)

Thanks!
