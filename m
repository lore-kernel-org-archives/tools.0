Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710169;
	b=Ri5/I4+9xj84BUvElrJPv8poxwNhjV/MXIKVou9j1jtQVRjCYKqn5j/anwmrI1j0xHgM
	 kpuTAutQHdwm7v3BfLY5sBUS/60/NzZHureCjTsw4lRJ/w/NajVlN/5h2BamtRQRaHCwI
	 8tJb1eSvlcEGi/UcnlqhRxrUDBo0qca0LT2/Mj3Q1OVdHeYP/TPfq78sSW2d2eSwo76Q1
	 Xqja224vMRO+1R87MKXVG7CSOxhtsQ0nAsrYCUqxMtpx6rkOzO9uTTKzXIbHivonTYQaT
	 I1QJl6/xsGi6RyFGH6VTtTnzhomXlUX/kKSilSzfLGBerFV8ik36jc5Wsb0WmFipmWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710169;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=UibnoWULjT1aRsPAYFdRiIITep5BpdiudsGuaGAkoJg=;
	b=T3cJIl2UKL6Q2NQynR3+q93IIBcsVrj1KrqWF4zRUnP1SiZ1MVxK+bCqBu4Uc2Sepp67
	 hHhKJAoSf771RTxcL+miPrio87vM63KlQ2InQ8WKwXw1qeeItRVOPSEToQkvnnanEh6R0
	 rqfNV5OAoc2toxLBkBuEk4v7P93r7BLSbogu/frlFe0QlAB/LHHoVbNnXxK5yFrEYfcFv
	 i2AdgvA9PcpVcJNFqgJlFvK92IGo8Qbfg3qLWBt1vgzwj0l9jYXAgXS2vm0tfB6Bdtuq/
	 en421NwqxXH/07gw00suotQPJZv3hQBABxr/IpaNAKRWdouLd+50xHI8kqt4lZnkT2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1qaAXREi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9E9606A321
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1qaAXREi
Received: by smtp.kernel.org (Postfix)
	id 99CA71F000C4; Thu, 26 Nov 2026 16:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B671F000CA;
	Thu, 26 Nov 2026 16:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795710169;
	bh=UibnoWULjT1aRsPAYFdRiIITep5BpdiudsGuaGAkoJg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=1qaAXREiF8uwHnQlugiE0/avwS+5SEmg0moHRZXQWs0mY6nZpVVn8PkkfhHz/Rq+c
	 uZpJJmy8c1CLB6S6zPx69+Ap+SNRYwXaVHhdQs8iGLYFa5urR06NcyWYDV+KvFmO2W
	 4mYBdj1NbXr9+AyTRPjFc42wbk+yMibAatTGSi1Q=
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH kgl] Add never_mark_spam option for Gmail targets
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261125-gmail-never-mark-spam-v1-1-479d47b1b3b1@gmail.com>
References: <20261125-gmail-never-mark-spam-v1-1-479d47b1b3b1@gmail.com>
Date: Thu, 26 Nov 2026 16:22:47 +0000
Message-Id: <179571016709.2980943.6097844956457932364.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=823;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=eBEPRAQveda7YWhvqpz7DzY5kAzk8rd+gSjeYMr3Tu4=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLI5Yq6fVb/revb18UP8u218IvWMvBbbp2jKdsyctp+9z
 kS2Qqapo5SFQYyLQVZMkaVsX+ymoMKHHnLpPaYwc1iZQIYwcHEKwEQmzmFk2PHgX+PzvfksFkYH
 4j13MieVlhxfp9y47trubh+rE9GPjjH8s3qqy8oj9Ptm/3qZswmeG4uqyuMze/+bPTxTUMtmOP0
 EIwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> Gmail's messages.import API classifies imported mailing list traffic
> through spam filtering by default, which can cause legitimate patch
> series or list messages to land in the Spam folder instead of the
> configured labels.
> 
> Add an optional boolean never_mark_spam setting (defaulting to false)
> for Gmail targets. When enabled, korgalore passes neverMarkSpam=true
> on Gmail message imports so imported messages bypass spam
> classification, while leaving default API requests unchanged when
> omitted or false.
> 
> Document the new option in the configuration guide, man page, and
> example config, and cover option validation and API behavior with
> unit tests.

Thanks, applied with a small tweak to rebase on the latest master.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
