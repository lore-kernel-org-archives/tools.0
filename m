Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CF3258CE5
	for <tools@linux.kernel.org>; Fri, 22 May 2026 00:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779411021; cv=pass; b=t6OebN7E6Jl5h48MqGNXClisjxDrDjipVVdk8jkprOxwwT5OtP4HpKgPGNGxuUUPYZejNQbtCzEhBf3zJpEzWyUNvLjW6YuQdYzN3u5IjRGNjDYg1w0oOQhKCVvHnJYbw4rO+1ZyZklBNcDXG2tRdcaV5z5mqQ6UFY1THI0NPko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779411021; c=relaxed/simple;
	bh=VWBNQLp5i3tfCmDySLJ5kT1dzfNbrCFkt3nUhvg59Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpImsOp2IoJlsykrBmnkUfaFYLLsxoPuzr7JBQDTLFZLY4bE6m78PhaqVH08HLqQKzi+BiVjhnMILgqobwNHBTdMdDhW2masKLQlxqBhbmXRA9VQAqVDdnjK3MfCYZHyzbN3+4DeTh40Qp3C0gVTcI65R16kUOka0mKFeZJjbFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=W3YdEEIV; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="W3YdEEIV"
Received: by smtp.kernel.org (Postfix)
	id 7C67A1F00A3D; Fri, 22 May 2026 00:50:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779411018;
	b=X+J1f++l/9DboY7+LVG1a/BUYM4WrnmwTcBL9eReoSpFJFbyooNgCYTK8Y9dJjCK/nZ5
	 HCaaNd0Jh/4xg0tDY30BPfOXxaIVkVlRLVJCSvUdJwFHxMBSz7SPhqUgt5gBNygzetV3P
	 cA+KHdRjJZKKv+KOQDoCIOZqk7RBdqwcbZQH+X8HTxo9rEfvuD+tkB3yWmakRnC04k6JQ
	 mqDTfW08o7+F73Mf10n0LPGUAB2tER/3EbS/IOzdMOq68CyNrSprXYogeKo8i3PRXE1tB
	 8Nmy3VLXswr3J4m5Qpl4NFinKqJN3OvJ+pZFMOnnC/HM4VlGNxCSTLX4hahLcY+PVLg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779411018;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GyoAnLMRLF5QlP89FUSdWOA5yy7H00VwoH1O55nR1/c=;
	b=vBRMv+/qp61xq60Oplz8aBJni2vJciYW25Fe9Qv00UDDSKbnbQbKy/XvRmEPcglzSRpV
	 rNiIqsc0bPbP3K47ZrgG6FqgjRgdRqaawboXgl8ZNydBB1jQirifRlJDcBcBbJmhUu91h
	 UAbRSgh64sxeHMltmiLg/DKslaaXm4aAFcCIF2oCE3CN4hoATbP5V67M6Og6GHSmVqr/S
	 k8Cp066ykGkC/NpXdb0dQc4TGCJOhlwanyxwAElnZh027J1qg6kkyByT4u0hXtwjYug3i
	 KLtn/4ESBC7aiVuypOTrF6rgK2X34q2NMP4EC7idsntcR6PatsJup2UDzErw24Jb0+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=W3YdEEIV;
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99EA21F000E9;
	Fri, 22 May 2026 00:50:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=W3YdEEIV
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 99EA21F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 79CEA40E01B5;
	Fri, 22 May 2026 00:50:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fIUKfy_V-YDF; Fri, 22 May 2026 00:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1779411004; bh=GyoAnLMRLF5QlP89FUSdWOA5yy7H00VwoH1O55nR1/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3YdEEIVnJMDpOKHD2lWP7zbJaFwlkdQeCUOEg8H0SuiECMMHUvnL9vuf7PTfCz2u
	 YN9z+94j4kPaCPd1xF4xqeVLmsrcU+nXa5bMsdbtyALXAygRyvBd295JxudY+Bxa/q
	 Epp1Su0j6Idn7Ftc8Oyz4xrx2W/Czu7Y2ePvqKwDhBX7RwEsyYp1ALvetPegKK0h7U
	 Y/WrJd0mwOix7ay8x9J29v6GeLAfbA5GGf7oJPjVruLIfQ79X9J0LzanWXkQYQN+rL
	 OtLMjAWGw/EkvvdKwKnPmjaX9ooi2ryp41rGH3DX8dAkeAi81zxJGb52pi3FnmWAzf
	 WTTmB1vD8CpBwVBUaqB3LDG8rD0P7ycT8JIvB5fAMBE2EqKI1S0IgBRYKpGVvJo2Zc
	 ook0XBSweW+6FqknHgpq2iGPk+Cvhea0j1IAOqckOXLtktupHPb+orHBcQ7Mwg/IYt
	 Xkioe3Q+DqGfCS3njLevGlICeL+Mt4hEwAATcakl/XxQVD+LX3jNO/36G3eXGEO6nc
	 HdDnEFU8SvpciTttjrnmn1FmS+6UVgU2vtu/4dJEGvPVNiz0AaV2jX/5h8HLkdTJ51
	 0m0kMDvVw8W9Yhkp3omptcZ2Zj6sKi8PRmC96xQZtJlhZkzJSxvG/OVSd5AZ/H3s/4
	 063c5M+H3TPEZuu0RWZ8S2Lc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1E0BA40E00BA;
	Fri, 22 May 2026 00:50:02 +0000 (UTC)
Date: Thu, 21 May 2026 17:49:44 -0700
From: Borislav Petkov <bp@alien8.de>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: kgl and git shallow issue
Message-ID: <20260522004944.GAag-oKAsjY0tTGBT2@fat_crate.local>
References: <20260520-invaluable-careful-cockatrice-e6ed3d@meerkat>
 <20260520-ancient-thundering-bobcat-2f086c@meerkat>
 <20260521011540.GBag5cvFqefROohMlm@fat_crate.local>
 <20260520-greedy-dalmatian-of-protection-4e28ed@meerkat>
 <20260521020958.GCag5pdn7ojEIRXMrY@fat_crate.local>
 <20260520-determined-emotional-porpoise-1cf7ae@meerkat>
 <20260521035853.GDag6C_Td1WFqMjFro@fat_crate.local>
 <20260521-chirpy-hot-cassowary-5df4ff@meerkat>
 <20260521154232.GAag8n6HItOIrVPd5o@fat_crate.local>
 <20260521-vigorous-otter-of-peace-daed58@meerkat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-vigorous-otter-of-peace-daed58@meerkat>

On Thu, May 21, 2026 at 01:04:59PM -0400, Konstantin Ryabitsev wrote:
> Ah, yes, the famed U.S. approach to foreign policy.

Well, that has been my approach to sw since forever! :-P

> I will, at least, add a better error message than just shrugging and failing.

Ack, thanks for writing kgl, I find it very useful!

:-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
