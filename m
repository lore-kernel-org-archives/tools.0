Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334802ED16D
	for <tools@linux.kernel.org>; Tue, 31 Mar 2026 06:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774939579; cv=none; b=HvnLXOF4OKfNodF4S9dNhnJfMty/2nWqZKgwYr54giu2jTXil/j4DNP7DMc3CYu0KJ+g5mq2D1aoyaoK/dfWljNn/WDkGsOufJN6wzeJXpeme5g7B+ANkMjnSW5mr/N/xfpb5h1QHd0Pzbrf4ZAfWCbxynNnTEx4TiH78wW5pDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774939579; c=relaxed/simple;
	bh=UUoMn8oAglNBCXPN0Pt7GSAlE+teIuY1B3pOtNd+kR4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ticBiG1iThfaug29e6sgNjadRKQt1y/AeahC6vba2PMNVlytGU2qMHrCyE1PUEyFHYefNW8IPuA1BeDKcEX6zHkeCgpnYrab+zU9NQu0+Xa80fVpWegH6+m9raZ6eJLCosUQmIoXLoW/6Y3fZSwwVaTJiEVo7RDrw+n00QlkJR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmTVTTaN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmTVTTaN"
Received: by smtp.kernel.org (Postfix)
	id ED7C2C2BCB0; Tue, 31 Mar 2026 06:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE61EC19423
	for <tools@kernel.org>; Tue, 31 Mar 2026 06:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774939578;
	bh=UUoMn8oAglNBCXPN0Pt7GSAlE+teIuY1B3pOtNd+kR4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=EmTVTTaNm2VSFAjAcrsObgF/SuvYC7kXMpaIDKXq5kBUw2VHRV0fEzUD/ZMlYr5TO
	 sM+Jx2pvLwsqEVFF7FiQoqo6/thhjd/D7f9hct+g4D/29q+kURMxubk3vEjJRXG5+H
	 v+AVQnwlnKbCZ3j2WYRCxvnBiJVErm87/HCkqGVnmKsRk3Z6t3N4E679W/QZqUObFz
	 84TZN28n2LGFVSpdYBSMwn4TZPHGcNJneil1eliCGI+OJVhyOkMfzCpF6AH8NXm5Dh
	 LAo5QCuM7ybzYx5u5+E0aOPrA8sfqvv3zxKj3YjdqMh2eaW9aVnUSVhisNRtt5M78m
	 j+4Aanvs0jcCA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id ABCC0F40076;
	Tue, 31 Mar 2026 02:46:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 31 Mar 2026 02:46:17 -0400
X-ME-Sender: <xms:uW3Laeikqa5LQeDw36xXZTfFMoD-WcOTfBG1ifF_jKJ1vbtCoPIQVQ>
    <xme:uW3LaZ160tmjCe6EWVlQ-Xv_TwCIWcjfGWBrNM82UQzBwSwkHr48rMq0c33glwn1Y
    z_4z71-LCrGFq-BCdHs5nYruGuOb-lOi2gC7Dg-4Sy51pxCW0MiEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefgeduvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvvefkjghfufgtgfesthejre
    dtredttdenucfhrhhomhepfdetrhguuceuihgvshhhvghuvhgvlhdfuceorghruggssehk
    vghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepvdeuheeitdevtdelkeduudetgf
    fftdelteefteevjeevjeeiheefhfejieejfedunecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgvrhhsoh
    hnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppehkvghr
    nhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohepvddpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihgtohhnsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehtohholhhssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:uW3LaQCLCMr90Z9xagvX_jzX7qdd7F6-1WHEa-JdgGf9lmfmIFbQKw>
    <xmx:uW3LaYjOGK8fflHHd5LfcBHkDAk-aJNJGCtiP8e7f-9QdwyQnIKmJQ>
    <xmx:uW3LaRMWx2DUXJSjGI7_ePh-SwolkZ1VkZTRqEFhmUInnY_SOisYdg>
    <xmx:uW3LaR7B9w2wK86Q5mEPT3kJKwEBRLB0QAqT6_dmTd3m-eH2XysF8Q>
    <xmx:uW3LaX2rbH99M2e7Hs1yybbcz_BYGRQdDavtZyzSXtOGisv3d6FIYbre>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 89BAB700065; Tue, 31 Mar 2026 02:46:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-ThreadId: AMWi8b3sQivR
Date: Tue, 31 Mar 2026 08:45:57 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Konstantin Ryabitsev" <mricon@kernel.org>
Cc: tools@kernel.org
Message-Id: <25a3c713-4fee-4a37-b535-58d9da34e008@app.fastmail.com>
In-Reply-To: <20260330-uptight-leopard-of-awe-ee7afe@lemur>
References: <c4de9f25-0c60-49e4-925f-7749eba57264@app.fastmail.com>
 <20260330-uptight-leopard-of-awe-ee7afe@lemur>
Subject: Re: another korgalore issue with linux-crypto
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, 30 Mar 2026, at 20:43, Konstantin Ryabitsev wrote:
> On Sat, Mar 28, 2026 at 06:53:44PM +0100, Ard Biesheuvel wrote:
>> Hi Konstantin,
>> 
>> Not sure whether this happened because my local fork was in a funny state, but I got the following issue related to a 'rm' commit.
>
> Yeah, I think it's a real bug, but testing is tricky. I pushed a commit to
> master/stable-0.6.y that should hopefully fix this (or, at least, make it fail
> differently). Can you try that out? Using stable-0.6.y may be easier, as
> master currently pulls in a new library.
>

Thanks for the fix. I've upgraded to this version now, but the underlying failure condition is no longer there, so I can't really say for sure whether things are any better now.

