Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41880392C2E
	for <tools@linux.kernel.org>; Thu,  8 Oct 2026 16:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475934; cv=pass; b=nk5dy71jQ3ceiaQtCQs4/xZwnrCDN1k/hlOykFQ/THr4tXBtJPlX1toNsYmsiN/W50XQvZoz0gGAbmrNFWzvyQhCPAhumtSjhBYH7FrwnBKgN76CmA3VrB4eVGTcgvej9Z6E9kGCzPxdLfwGckW0nPV5Ff8j/uK67qaJb3ugq+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475934; c=relaxed/simple;
	bh=BI0G7qBpI/7KwQFAhmOUXBzLsg9VZTTr2gCpFXZLAhc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WC5DVtipg2dcSJj1wyj9AvGAcylqLuAobT95QFBMwQclDsmC4shqnSCVHgBC2t5J2TfxhCsbQq+AM0RRTsnipcz6K0JcEKbAnKuL4zzzyKdInPqbqlFKsdibcBBdmHZ6e9hLgtfq956JtTDbHGtlJcGNBqncoSg44E3It2auaKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfewQEvB; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfewQEvB"
Received: by smtp.kernel.org (Postfix)
	id DECE91F0089A; Thu,  8 Oct 2026 16:12:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791475932;
	b=IfR0SwDik73gqDGERfDfXB3ibcbwO5zraKY7PcF53k55T+cYWBp3o/Qu8fEuClqG+3/Z
	 NvvFqBrG4VTZe67qBfWhWol0/TottPf82IWtfI1QtB2xuMymTnY1Mz8eLa6sNEOcAoXT7
	 dhmXnCDDrA++apF7M8hpZZQ8G9gYhqYUL1yJSGuZG+W8RFbf0JiE8JpJkB7RIMN4ys3jw
	 pKCCYxhQsdfi8Inl8Fqub3ruFWfsxHPPUH+Dm9oDhDWiw3S2tW/W1eLp+dG50JrQlByOP
	 B92kLLKV1b+wngz855tZXT99/fUncgSgiJlp4Ii6ohtLaRNry0dm7gOVIPt0deYUZkg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791475932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IGTDk2M1CVr9/HPRZF14PhrI+tmF1KcbANTHbSO6d8s=;
	b=2oDg8LPfb+wnFr93aVH12wgGQsRbOiFHY3gwoK7ZnjEVlGNpoYtkGzrovKFs96ffQlj6
	 vk1p0JhgCaXprUylWYIXlTBjxkRf9l0tfJ0TYP29BNVar7fisFqj6FtTihiS2ZtHeAMtj
	 Bd74BRCRgOCR3ZxjAm5hZm6/vlLTiZ0g5JrSgIhyrb96qQ0xbkl2azVRPbCA/CAQp8/UK
	 EhIwGWk2Jr5Yxy08eSvEtGUMbe4GMPpKHnWg7gfc4Kiwpb+5t6VT/8l8fre+LRgDqW0Yn
	 cRwOmd+WRtypHNhNO7V1H2X2eNvv21l2IgD0jJZH7lPx81Q5r8FCVDzuoZ4NdcANsPg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gfewQEvB;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B72E1F0089C
	for <tools@kernel.org>; Thu,  8 Oct 2026 16:12:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gfewQEvB
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4B72E1F0089C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c45111bebso2131336f8f.0
        for <tools@kernel.org>; Thu, 08 Oct 2026 09:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791475929; x=1792080729; darn=kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IGTDk2M1CVr9/HPRZF14PhrI+tmF1KcbANTHbSO6d8s=;
        b=gfewQEvBhEg6usCsgREqZkHWqVRUjfD73UOShblnXemgo87aVG1y1d+wNb6/nA9X26
         g0hZCVIzlBhKZz+KA0EvRNI9xcURy2nQuQKUR/jUc7/qC3a/g28AvjT6F/XyOudc1axJ
         aDEJEYJKrjLoJiUkT1D8bq8FoGZQE0G8UIMXdrYkEFHIMBNq0/B+d28KCxRDLDSsLXcF
         rRfjBoUdO8tj3vWg3EPDYHAX0Pwu4wmoz8kWOKhOWq2W4xeXo2IkrFXytTGzRDYesZ1H
         uPPOyEOIFy+HT2ZvYif8WvbetwSyaGj1CjZKUMmc3Yms5EXF0JCG2hrc0+As1Wcx8AEg
         GXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475929; x=1792080729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGTDk2M1CVr9/HPRZF14PhrI+tmF1KcbANTHbSO6d8s=;
        b=yvEAShmEfdypONV4PZV1AaQ2Iw4AKlHh7iH01/BeNLprtDowdiLpF4Z4rZ9l/erdIY
         5Nwdc67N9ZWu60KCUY81Bzt9yBNXhi3jVqeA9cCyXqPyVG8MO/5s12DXOYhAY9DakT0j
         +UZSEg7PvhTx88u0se1U+F4Ph8xGmsh2tw0p0oyyz9lWt+b1OY1t32pFnRdu/BBrkAKu
         FV4wPOqI+xJhKh08Xe5Qa72o3Re6IaQ4NtgvVe3uutawV/RV3X0VlHmNczRydBSIPfr3
         ATogvr8Zh3S8DGpVT9mU96aU98COo496CKgHgIIvdvpMyyPP18rPWeF9x0HHJqc0Stb6
         HG6w==
X-Forwarded-Encrypted: i=1; AKwUvBwmLN2QH2OPq5e19HOXY88tmsHJIrvX2M4dNHtJUXdkvW9lvX0w/RPPerdXldjf6o08o2HEEw==@kernel.org
X-Gm-Message-State: AFq9FYKjLvk4dF3qSrbTJtWq36mpqueBsYsk/Rlq5zuw2hKL8+JavT0W
	kjqHTds9uPGkIgvpPmUPi3eR2npLUtHpo25Ss9NS62WaE7JKp4eK3ItM
X-Gm-Gg: AYBFou0Ag/4k4us9arrV55YHLbk4+ePBhlmGgMTEM9QtKDAwzB7e4gARrYKd/NaESsL
	xmpkLRakhpn7Asqi12ymGJqAWxmr0YcqDUJuhHOzITw80vGNaW206ha+rGoClvQTpVNGWvlIPFK
	vn6zxJOC+wxp2NiEIwK7xM1c0mrjGcWpOWnk8gv2m1VPqFRfHwcDXBRjRX9DGbeMOrANLboAxqc
	nKVp8R8jyYbIuUsg0o+E61E3BKerNcF+945Rqa8YS1FI5F6uN34HW3fDApL1pK8eJ78wuJW7jjU
	dyjsLy/1ep8hbVZJ6rgfIljXukYJc8PRkzwtexhsSRLHzqQ0FBmBC0mDVzVFaZ2yCxsK6P4SFp+
	qM+EoW/jHEIWW9uLAcuW1LxEgGv7CieqtYse2kb/NCxc65RNbCHmjLeyzP5KQfAQY31IySVzgi6
	whA32kfyZ9FX9Z2DiGJL+nIw075lqlWmYdBjqd6xUnjxj4LqE+KnHRPawtZZ4+WJXiFv65VDFb0
	XQpRP+28rvjyYObRVqEC4o8dunVzM6AAmIqQmZeVCa06Q==
X-Received: by 2002:a05:6000:25fb:b0:48c:77ad:d52d with SMTP id ffacd0b85a97d-48c77add59dmr9194549f8f.43.1791475929174;
        Thu, 08 Oct 2026 09:12:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db650fd4bsm478599f8f.11.2026.10.08.09.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:12:07 -0700 (PDT)
Date: Thu, 8 Oct 2026 17:12:05 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Gregory Price <gourry@gourry.net>, Sasha Levin <sashal@kernel.org>,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org,
 workflows@vger.kernel.org, tools@kernel.org, x86@kernel.org, Thomas
 Gleixner <tglx@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
 <corbet@lwn.net>, Dmitry Vyukov <dvyukov@google.com>, Randy Dunlap
 <rdunlap@infradead.org>, Cyril Hrubis <chrubis@suse.cz>, Kees Cook
 <kees@kernel.org>, Jake Edge <jake@lwn.net>, Gabriele Paoloni
 <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Nathan
 Chancellor <nathan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v5 05/11] kernel/api: add API specification for sys_open
Message-ID: <20261008171205.7239c463@pumpkin>
In-Reply-To: <asemkQ2v0di0Eea3@hallyn.com>
References: <20261008084956.2911790-1-sashal@kernel.org>
	<20261008084956.2911790-6-sashal@kernel.org>
	<aseRXi7hMWBBc0tB@hallyn.com>
	<aseWPV6ZRQM3JOMN@gourry-fedora-PF4VCD3F>
	<asemkQ2v0di0Eea3@hallyn.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 8 Oct 2026 09:20:01 -0500
"Serge E. Hallyn" <serge@hallyn.com> wrote:

...
> 
> Even if there's just a three line comment above a fn, history proves
> that it will not reliably stay in sync as the fn changes.  An automation
> step/check is needed.

The only way it can possibly stay in step is to have the compiler process
the same source text.
Then, if you add/change a function parameter you'd be pretty much forced
to add/change the comment.
Return values would have to be documented at the C return statement and
really as an extra parameter to the return.

But, IMHO, the whole thing adds too much bloat to the source files.
When you 'grep' a source file, you don't really want another match in
a big comment at the top of every function.

David

> 
> > ~Gregory  

