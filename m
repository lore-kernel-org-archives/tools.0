Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0454A2619
	for <tools@linux.kernel.org>; Thu,  8 Oct 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465227; cv=pass; b=ADrKtgnYw1LJopqx102VQVGMUcm9HyIFmrTniv5+PTEgVrx5828nmThOICommmfsSEbPue5Gfong0ojK9KiyXvB7XZAeJt8xYkWKoAZQWYboj0N8vPwn4boDjsnLMJBB5K7zn17c/dtfZyvasfeyQNrx3uhdaUfd2432WiMOfLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465227; c=relaxed/simple;
	bh=7qtI5gtgg8HMBmacX6qKEDXcXJKwtRBJ+yKlbMqIu+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2lG9tt8zsQ28Rbo3UY6GHA6fSd857kcFchqdx2sTi3qooL5RtMdeNN3i65tTQqqHra5ogrMpYCaOIyKp70l40rAZPxNlI8TlceA9Qr+mzLEr4L8EahN+Gi0grXE6Ryk8zqvcmXsLyM2S76/5ZV3yknCrbu8VVX4YLRLSPdGGG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Nax/jybT; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Nax/jybT"
Received: by smtp.kernel.org (Postfix)
	id CA03E1F008A1; Thu,  8 Oct 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791465225;
	b=DeJH4UVe3LH+BJBBEsyVBbdKccvf9Ni6O0whbmb7w2Ahd1NrgMLa3dzZ9GnVjdPznaza
	 uy3HXjJraQiD2BFnubV2WUC8IF/7u2k296gsCWet5ex5X5yV9jG7jgGX6inq7OUWgHH1Y
	 vVA+8PrPnKXbcKYqH9oyTI4rxKWB2SnLtG/pwmilPDMwkGnzGrg2fh88E8Mh6S0fBS8Ta
	 fJQ1gQXxRS7icdxB4qhGKYqoHe6Q4RID1toEV2HlGe0ufAWceGary9tvII7hv4lyrWe6s
	 17X5MBRVCaZkAZf9IZ0prpcgku7qe3aVt/xu4haCOVPMLdwXyf7wZ8lmjYEwtsgIseQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791465225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HO3C9RpYvCSZ09L6Ew5V40K2HpvgcXSKkDoFhjI9Kx4=;
	b=lzQaR/tMqcC+FYFWUxP5HXWqQafpu8VmZGUI9A1b82V8JafUrpQ7MtLrJwlX3frIJ/pw
	 bn9zoe92SBPlCHYuCD8T9UBXOnHkZItE7tWM41OycLqkmJHO0rx492AqHI/dPMBhRLt/H
	 cjhszJezgpti0XhjfTkEmxolTXMTzUKhNtq5EfOoT6dCcm/yGunlO6/f2yCPhHctEZOp0
	 39gViotCyMENGFngfI9ytrI4CLFWWQqKlceu1u7nFW+KG0HjR4zACU7lt7OBciq4Y8Fb0
	 nPSlTB/nwzlADIYItN2KWCv80W2ZaUFD4jhPAmPdAOc17fcqWUJmGR+FuIMVIojAG7A==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="Nax/jybT";
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA8481F00893
	for <tools@kernel.org>; Thu,  8 Oct 2026 13:13:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Nax/jybT
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DA8481F00893
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gourry.net
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a020e65269so23129065e9.2
        for <tools@kernel.org>; Thu, 08 Oct 2026 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791465223; x=1792070023; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HO3C9RpYvCSZ09L6Ew5V40K2HpvgcXSKkDoFhjI9Kx4=;
        b=Nax/jybTruHJxoY/gdw7zR8e3gcE/bwnGj38ReTFT9/ZRXU3TOFtHEm9MBsD7bIfXG
         ovV6/XZ1mcoOcmBfNKq45PycWbn9436CrjuXi+T82PdczR8S8SxoJqSHoiYe880TTq4i
         yk2CVU33pMay3oarpUjmbT/vVWfnYcCfwBJMu+68kzsmrkCFuG46eKO4pZV4Rf3G2gW8
         MQkhPDegWbSRPBuvWtuT/rYpTWSoJldBUJFdTWMNstxrBLCA94zPTmN2hI1GHtSYOYWp
         G9phUeTY/yf+kGziy72/teGu+5MkCRtjpm5YF8zzXXcxBmYS5VYP0GCAuGqoEaETeJ8G
         Eo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465223; x=1792070023;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HO3C9RpYvCSZ09L6Ew5V40K2HpvgcXSKkDoFhjI9Kx4=;
        b=1LINuIGjMe4MwK5VprrpazxZOkpvA1gLjeTuNzVsahRBEfk3wP7MCinyx3eeFhCKLj
         63RZaEB0FVcbphzOwHVezdS7wmS9O3Qs67LIog7s1GHyYh5ACiGF0PixE8jwx7a1Jqb5
         thM/kQaNPHaViotYE0b4BORR8dtc+zabp+tjaXPDweO9srF8gWLhnOfLQ9f5dQMZDcCU
         ZYkmRy6fpQyV5vadAWZ4WIVdoGfDIo3mTcCeCkpa+vozgzWOk7XuIx1qeBIPmuqFIGog
         T2zsChpNJbkSu5ePP3ENSb/UuzJAez/YfR9xO/B60urDiO8niDiU6yOV+FTaVVRYqLAJ
         dUCg==
X-Forwarded-Encrypted: i=1; AKwUvBxmab1yTpwD/V5VVq+tzsjOjGeszJ3KpZWV7AhQk+pBPDHaBbi6sF6327do907YSuLOvF0LUQ==@kernel.org
X-Gm-Message-State: AFuF++knMmNVtJpmLd6tbUQpFRwBDDLRw0cFJ4XzgHe/GHDL5MQ9TCRU
	IedJi0yPEWObZnS3eH5Z1YZLYywKZFMPr0x+qGP7ZbO/YDaLrMUzPkGr/zvZx8VfVHs=
X-Gm-Gg: AYBFou1gzUjoyhStjwZP/pjW/2Rg4fO6lQhsFGjx/SK3Cy61F6AB2Qi9IQAKSyXQA3l
	OybxQ8RICXE6y3uwNrTQeQYGxINPB0j+0SDLU4X1SdjlbwSjtsxS1C1eBiO6SpExAapycdBgQ7S
	VwcauxfcgRGj7rfyA2jOmhoJgOr1ChfFUIQXNgiRkUzXWZcaV0xj3V2umkkTevwT4hv6DZZM9FV
	Ub7fj4zZK+6H8stpHERZ5/Qh+wf0z05fr6SnQogO4Yt/YzsA2mWgMmYoTF97ofOTyg3WDK6flfc
	MCJwPmFPNHajldm8FYHrd6sJ43KTY7w8HlE1WUOetcwbqcDItXOPy5BmWNXJe8zsW/I2vEE3Ybq
	An9nE/FnQKjgZjCQEEvQ3qvCLIEmHA3yO8neNOkIdsP1OlK3LxJg3Z4Yn5fkBikCs4SS85PyNq7
	7HMG1ggtjCJDh0pjZUHOOXoF+yuTphzcLLyOhKpWpDq3ml8KNrmLbglx9BWL7hPLf5afEqp2ZHO
	WcMeGoxuw==
X-Received: by 2002:a05:600c:19c7:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a180648d69mr101498205e9.24.1791465222920;
        Thu, 08 Oct 2026 06:13:42 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([185.194.184.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm221404825e9.2.2026.10.08.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:13:41 -0700 (PDT)
Date: Thu, 8 Oct 2026 09:13:38 -0400
From: Gregory Price <gourry@gourry.net>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	tools@kernel.org, x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Dmitry Vyukov <dvyukov@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, 
	Jake Edge <jake@lwn.net>, David Laight <david.laight.linux@gmail.com>, 
	Gabriele Paoloni <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v5 05/11] kernel/api: add API specification for sys_open
Message-ID: <aseWPV6ZRQM3JOMN@gourry-fedora-PF4VCD3F>
References: <20261008084956.2911790-1-sashal@kernel.org>
 <20261008084956.2911790-6-sashal@kernel.org>
 <aseRXi7hMWBBc0tB@hallyn.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aseRXi7hMWBBc0tB@hallyn.com>

On Thu, Oct 08, 2026 at 07:49:34AM -0500, Serge E. Hallyn wrote:
> On Thu, Oct 08, 2026 at 04:49:45AM -0400, Sasha Levin wrote:
> > Add KAPI-annotated kerneldoc for the sys_open system call in fs/open.c.
> > 
> > The specification documents parameter constraints (pathname, flags
> > bitmask, permission mode), 24 error conditions, locking requirements,
> > side effects, required capabilities, and usage examples.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> I know Kees and Jonathan and others asked for exactly this.  But one
> downside to this is it makes just paging through fs/open.c a lot more
> painful.  Maybe it's worth it.  Maybe "noone will ever do that again" bc
> that's why we have ai and tools.  But a) that's how I've historically
> done a lot of code research, b) IMO something like a manpages section 2
> under Documentation/ would be a great place for this, and c) we can also
> use tools to always sync these, or even show/edit in a single view when
> you want  ('kdocedit fs/open.c').
>

In many, many other projects i've worked on, these docs are placed in
the header as opposed to the .c file, but I understand there is some
pain that comes with ifdef.

Keeping it in the header ties the definition to exactly the location
external users import to find the function - so it makes sense.

But separating the contracts from the code guarantees they'll go stale,
so I don't think shoving it in Documentation/ does anyone any good.

~Gregory
