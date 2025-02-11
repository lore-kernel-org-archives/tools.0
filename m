Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEE01D54FE
	for <tools@linux.kernel.org>; Tue, 11 Feb 2025 18:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739297338; cv=none; b=C0+GT5mtQEar8mLULAausgK/kQeiJSq+VItkLRoODjskwvdJONilYuDZIsE0SMfyZ2eT/YYBGy2WCYKJtHX1yYYtCZREfQh3VgaoNk2VBjCUOm3E6FjzAMtDboA20DyXjty9AB5eaiqkWtMu5kJJZKDv3SCuasXL8Vx2hXAf93k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739297338; c=relaxed/simple;
	bh=7LbPQFmnRP/DJ1wgk46u8cCxc8mi1YebeSGdFfNMozg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjnc3keO80OPgZt4B4uq9hcDN1nFdUZC1hbyCmMxipVn6jXzKqw1Js15EUOVmJML034LByUmYraQcgOGHk2AnXDFpB2FZPhfQF0i0xNfbn4c8ZUQu7jr6HNTuY6kgUMlZ3LEa6AKluhRtyhSd+RlT02sh1vscY6nW5mE1Ao5r98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xg/Rmnbj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xg/Rmnbj"
Received: by smtp.kernel.org (Postfix)
	id 31814C4CEE4; Tue, 11 Feb 2025 18:08:58 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47855C4CEDD;
	Tue, 11 Feb 2025 18:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 47855C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-726efb912c1so20168a34.0;
        Tue, 11 Feb 2025 10:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739297335; x=1739902135; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AVbIuzTXhfcOEZLUh65kwjA3PWjz3tGoHrhEq5lJUFI=;
        b=Xg/RmnbjyJyzOgm6c9QkD+OsxJ+mwjFMfRKD4M8+TJ8M1Emy4gz7gTEMGwStZ8w5qR
         NFgG+e9vroKRKJvwrGcO+bsQcj4+uGCspW4xhTJ94/pw+LInugEEmmHA91cwRv/+AD2R
         ZHosN4CM+1hLW6RiqeyUlt3H+7UTZlFeqNvfEX8ANnQYqwiCzfNV8wx2rSPGPEQ7Ae7o
         +EtcmAzfFKAsHQqDezMffG3YDXgK/fNdt1iVHIL6v8GjNVSzV1MJPRqjRcKowb+q9W2b
         UhB1RCaVTvqiwlrG/WvXxN1fVhjh0erRfEpdECbydjMxlSMpQuN+oW+R3+9K/oBA+7OU
         upRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739297335; x=1739902135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVbIuzTXhfcOEZLUh65kwjA3PWjz3tGoHrhEq5lJUFI=;
        b=hEwuhRsKVLpSqGHXtMCO00Fnrsr3Bf5M9emepO/f7vmZGtEqycPRUI7jhWn4txjN2C
         PCe4/IgJXg4n9ACTViFNe0IQOdSXrCNl/PqZ4aFH0cfsjYMqn3Pn01uO2hET7yopMp4O
         uL7TWJvnUtiTQL9KePifelkovWz3QS57VCxlBOows6+siAMBTiKGw337a355p+YH6Dr/
         /aMJfE0eJjFEmwVoHQWjRvKlkh1tTwB3S3QJbE/5YR8nYARzGASmoDNO50yU89ndHkQh
         Ol05cqmMMd7rPWzhXDWvQ0cwaVDruF5uL3dM5NRL4v/gM9W9rSQIN3s8JqQcDeLSpFi7
         ccFA==
X-Forwarded-Encrypted: i=1; AJvYcCXufWpvJDuqzqLya0oFrkijmGg8nrzlRXzy1ic71WsKGHUNodFPTvWVbh4vtWMqhe/Ln1/0jA==@kernel.org
X-Gm-Message-State: AOJu0Yx/rLhIGBDPaT03QqebULsKbDckt1FKWKaVUc4vIhWw4/U7WVs5
	bGTxmHbW+mk1r1er8AivHrTbGxPcn73rpOdDlcDHyI1NxKTE1I/qVkFS4L/C
X-Gm-Gg: ASbGncskROvkAIZrqUCZuO8n5rqK8UZie+McrOmaH4tcK+YsP/aqEgBd//eGkpS8xaH
	g+8u+ugjoCpIWzTikGDi7eQg7XJUQZjKsf4r4ibe6owanWKXwcZo+ZyoAj75Oqi5300Qhej4olq
	NtlxjAkGW8QW1s1fazo/h4FXfG1DL8fyS1S1BTY83e+KDYxXrZguARdNiTw3HBQM11Sn/DQHYMX
	d/QM6pRc7P990usxokquNIKuxxQ0XI1a+io0KgdNwYfidrw+y1+mSWoPEGLBqAOvbUaEPFCwe2w
	STYo1Q==
X-Google-Smtp-Source: AGHT+IFUjTk6R03a9mnyYvGZvOy8bIQGnyfXM4BrCVA8zbKqzdR1z48dVc8kyMlZ4/VW2D29QC+urw==
X-Received: by 2002:a05:6830:14c6:b0:721:bdd2:ae0f with SMTP id 46e09a7af769-726e80bef74mr2963206a34.12.1739297335578;
        Tue, 11 Feb 2025 10:08:55 -0800 (PST)
Received: from illithid ([2600:1700:957d:1d70::49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc544e6236sm3474460eaf.16.2025.02.11.10.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 10:08:54 -0800 (PST)
Date: Tue, 11 Feb 2025 12:08:51 -0600
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>,
	linux-security-module@vger.kernel.org,
	Tahera Fahimi <fahimitahera@gmail.com>,
	Tanya Agarwal <tanyaagarwal25699@gmail.com>,
	Daniel Burgener <dburgener@linux.microsoft.com>, tools@kernel.org,
	linux-doc@vger.kernel.org, linux-man@vger.kernel.org
Subject: Re: [PATCH 1/2] landlock: Minor typo and grammar fixes in IPC
 scoping documentation
Message-ID: <20250211180851.rfx2oubh4qwd3h32@illithid>
References: <20250124154445.162841-1-gnoack@google.com>
 <20250211.Ree5bu6Eph2p@digikod.net>
 <22olfm76rcgjfs4vrr3adtbznsnz47kaehlr3ljn6e5jkc6waq@ue7azstxlwfv>
 <20250211.ieSoo7Phe5oh@digikod.net>
 <3unkhxarmiddobfjvojx4sdpgitjld26udcagka2ocgrb6c2jc@dcg4w5yk5mut>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="arxa5i2sgqsymw5c"
Content-Disposition: inline
In-Reply-To: <3unkhxarmiddobfjvojx4sdpgitjld26udcagka2ocgrb6c2jc@dcg4w5yk5mut>


--arxa5i2sgqsymw5c
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] landlock: Minor typo and grammar fixes in IPC
 scoping documentation
MIME-Version: 1.0

At 2025-02-11T17:13:21+0100, Alejandro Colomar wrote:
> If there's consensus in the kernel of moving to man9 docs, I'd be
> happy to help with that.  I fear that some maintainers may fear man(7)
> pages.  If you need me to give any talks to explain how to write
> man(7) source code, and show that it's easier than it looks like, I
> could do that (G=FCnther already suggested me to do so :).  Maybe I
> should give a talk at Plumbers.

Consider me a resource for this purpose as well.  I gave a talk on this
very subject at DebConf 5 (not a typo, that was 2005),[1] and have some
familiarity with the man(7) macro package, its history in various
Unices, its groff implementation, and the underlying language of the
formatter, troff/nroff, which were developed at the Bell Labs Computing
Science Research Center contemporaneously with, and by the same group
as, the Unix kernel.

Regards,
Branden

[1] https://web.archive.org/web/20071015000604/http://people.debian.org/~br=
anden/talks/wtfm/

--arxa5i2sgqsymw5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmerkjMACgkQ0Z6cfXEm
bc7XExAAlmQUabmzuBGFX+AzV9x3Xnr57/GbPD+ItVXJBsl0VqNCdnI1vGp1KYcM
P75rez5SBSTpUa2Wv8J4zO2Lyyl6MF5+x74FEBhZqO8+3zpQidYj8rVauMNCKF1n
htogdd/moAfj/D1ImKC/n99dxFtO1Gu1hWoDJ5NLWGwGQ6blsNKlQrmDzgFskSRJ
GSi0mFNGGLXiZcsvffeThFiuW5QaH+/WcNHslXi0Rw8ceCB98YNGWGg9vDv9s7Qc
jH1EdYORH1Z6poXIGEmzHbi/QvwJLAz1O2cufSnpiObuFgUxH526YGXvWRzA/Btp
tqKa5r6y0ZDzMvZn0uDcUfTZDVzLBmXboH2KJw6l0pJNlhCn/KkHHwp1vo4Lb02h
3wsdVZmoG9FAvlup7O5ELr+SkD89F9WR7SuNsKn0eaYZs4fd0mJ62zX1eQCqpBph
Z26EhNNeDxrSh/fBvV+pcxI+8+qURga3eu0nEiYboZA28Boze6wD0mokxXQT8DZK
N+kPM8EjRMaC4nR5rJ5Tw9sYL2f74wmu3n1SeEz9RIR7MD563dplh8yB6FKiptZJ
Ihfx+ewo33+QCkp+BK1kQuyLqTf9IwsNqGLBT2lt5SoY+FpWxSfM9i+lHG41fzrw
l9DoYI+UOM0widemvgTUS3otsWaitt0Hnv7wCmNu4Q6ZIEUKxA4=
=UyNd
-----END PGP SIGNATURE-----

--arxa5i2sgqsymw5c--
