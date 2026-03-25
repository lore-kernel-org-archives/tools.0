Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E70F3A9DAF
	for <tools@linux.kernel.org>; Wed, 25 Mar 2026 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433980; cv=none; b=BndGnIbqP/o/sghZtkO0ursFZik8/OBu+iA+n1GywAF82No0SBnBbcuxESM6NgYRC/dnfUp/JajStBHH0CJa/hE53IPQ9zTJAlQJbOavjgD3qtJGnBcu7e4krPfhioryY+1XX4nnF8i8JWiWNhRNpLoMJJ3sGDnOI/aN6tt5nt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433980; c=relaxed/simple;
	bh=xoDLTXITzXxn9QmYK6oHOMG6QXemNtZx/xFClZbjKUM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=o2Cd0UxXlJFlDQ5VolO7C87X/7Q5lH4QRnkK7LJVUqSe+Ht+lmBGF3B/mEGM1d1TlADKhAtqAjAb59ag/M5fBW7RKrfJ1F29NdlQ1C4VsA2h16UqsyRx4ITCoxnonGsj+WNov25UKADY0rWG3EkStUtLpK8LUC8qhHv7sUo2qxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Q4k6wjf2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Q4k6wjf2"
Received: by smtp.kernel.org (Postfix)
	id D15DAC2BC9E; Wed, 25 Mar 2026 10:19:39 +0000 (UTC)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C67B2C4CEF7;
	Wed, 25 Mar 2026 10:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C67B2C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 82EF140E0222;
	Wed, 25 Mar 2026 10:19:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ll6DZXozMMJ5; Wed, 25 Mar 2026 10:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774433970; bh=xoDLTXITzXxn9QmYK6oHOMG6QXemNtZx/xFClZbjKUM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Q4k6wjf2nML0cTOOc04Lu6boACDqmPTarVnvVq+lQaDV3g+VKp0h1oIf1iruiHdJN
	 1eZ4CnVJ8hrSWSLMGezT6Ghz3bN5e+OqkZ8o+cuHCfD8HRfisO9YHB175nuGhnfy6X
	 ub+AC9wBZRR+2SjN6LGJ7f2FPx/BlvjvBpFYLqocnJRIOlPFb+r7TPjciKUvcZj8m0
	 TML6ZPD+Ve5ciECOMmna15bIzlIYGzejyrpaMOmbiqR47I0FWbrcECel6SyR0rz6cR
	 aur1NbUED0A0Z+y46D+ZZq8f3qCo76jPz0BVbiK8gS1ZdZqLNJvWFfahp2p9FQ272W
	 nmc0VsVw/FpGQ82asCQZVaT+QB6vjeyQINrKh1SQ/ndcvAgkW94z4OYBppLSi2lczR
	 q8SSuDiDqO/3wfVmaSqk7LypykFglZNLiSTe3oCzTxMNT5YwI4oQDbFWNR3nKgfgeH
	 2qfWpfhDGGp8N+U8oJ0P+fmxiWmKwQnhqkluLuI5IEkd9f5N46bL+QJROE1UXpsE95
	 aisT2cXhbGMMrita2ns+nBsnLqhN5AHjGBwKb73IDL6tlFEvkQV8Br0UThY/KxIjv3
	 v/g3UephBKdDl1YhLEX+f6yfGEpgr1cAHlC+651x2M+NoezyU5ZDSrK36MGWU+KlaH
	 fpRKtXIZ4ucVsm+HchsuJqkU=
Received: from ehlo.thunderbird.net (unknown [IPv6:2a02:3033:266:68d6:b127:ed1d:b692:3857])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C8F0F40E01B5;
	Wed, 25 Mar 2026 10:19:25 +0000 (UTC)
Date: Wed, 25 Mar 2026 10:19:19 +0000
From: Borislav Petkov <bp@alien8.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
CC: users@kernel.org, tools@kernel.org
Subject: Re: b4 v0.15.0 released
User-Agent: K-9 Mail for Android
In-Reply-To: <20260324-shapeless-poised-turkey-f7b7ec@meerkat>
References: <20260320-portable-jaybird-of-focus-41fd66@lemur> <CA+JHD93MSC=GZMscAu8-uMroXYrHzn-w8NgHVSLyjNLJ9Wa=OA@mail.gmail.com> <20260324-shapeless-poised-turkey-f7b7ec@meerkat>
Message-ID: <E6DFA188-6979-49A3-82E4-F673A6E66994@alien8.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 24, 2026 6:13:15 PM UTC, Konstantin Ryabitsev <konstantin@linuxfou=
ndation=2Eorg> wrote:
>On Tue, Mar 24, 2026 at 01:03:47PM -0300, Arnaldo Carvalho de Melo wrote:
>> Can this be integrated with sashiko? I=2Ee=2E starting an AI review and=
 waiting
>> for it to complete takes time, if 'b4 review' could query sashiko if it=
 had
>> reviewed already can save time=2E
>
>It is, but since sashiko=2Edev is very new, there are rough edges around =
the
>integration (such as not properly handling reviews that are still pending=
)=2E
>
>https://b4=2Edocs=2Ekernel=2Eorg/en/latest/config=2Ehtml#term-b4=2Esashik=
o-url
>
>-K
>

I hope you guys are planning on sending the sashiko reviews as replies to =
the patches=2E=2E=2E eventually, ofc=2E Would be useful=2E

Thx
--=20
Small device=2E Typos and formatting crap
