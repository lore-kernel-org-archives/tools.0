Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76091233927
	for <tools@linux.kernel.org>; Sat, 25 Jul 2026 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987213; cv=pass; b=NPKWVgzVq/IiP80CkymTtTWG/hnweZtIQ7iwpfItUaJNQIvrGp9NLMcgyy0HbGNmmrprbHrM643EgE+33OPovcRHR5SaCbxy2JSVz/T3IGlEIWVEIKKrWGWQK/ZTuj7HUFBMontoyhnqWz4tCcEvqu5taZEP5e9ca9Yf2ERfYqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987213; c=relaxed/simple;
	bh=WhtXlcVWUlJmr3wscVfIwD+iGqkU/NbBSE7GrImfTMQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H9greWMJMQdMcyutr2p5PLzhVH8r378o6kJoWolVrHig4E/ujOiVA2qjcPelQBP1UJTib33KXEX+YTnES8YmRb7sCzaTws3XAGI8KUkiczRItAyGgk8uJZdG4ptMhfDkSh50B5PB4aQXx62KzD57MvC2EvsENe/dp2U3HSEN0F8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mkFiWi5W; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mkFiWi5W"
Received: by smtp.kernel.org (Postfix)
	id 698B11F00A3A; Sat, 25 Jul 2026 13:46:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1784987211;
	b=dxX+iE5iejtwbzvOwpdJkqk5dit5T1VUC0Ta1L+mq1o8/EN/zPebbifQlh/9EOVsuO/8
	 EiN6McTHEctS8m68kTpU2ahaxrJQSZqP1dHc6P2OcFaFWqBInWAPSdIAs/yqE7YUL1bGp
	 aolBtspdutfJHTzK9gKXJfpIHruESP3lBW4wr1n/d1mGdwq6ATGtTYh7GgohgJWNczx7i
	 m/P/rC1f/os54jI0f62d4+WI5/PcSE/CD2AW9C9xm92nJmsh6J2DNy0fskNeGj/j+7Yiy
	 gqqZC2s+hhJaltZUnRF7xue0Ye6NN5l17DODAN4Wsq9NCc2B4FSq+ziRUxXGWyOJ4CQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784987211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:
	 Organization:User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=CVSGJgFUGEoODitIUtO+q4Qxb838k8VgnVRdsNHa/AU=;
	b=a0C5hq4JUJUnwtwVFxgy29E/jYeCWN9VL5wPkHUMn4zY8EMcInJ4nHu8t//20OWem+4X
	 pjYTqz1nDZRr9aaj426rjxfzQhLl19o5YHnEp1Dxv4EI9vqMDk5YqqZDWLcIhFSKSkWF3
	 +xyRjE84gsp02W3cAxWVKpYURRzixirIawsiQ8uIsZnDXbyKDXNicSrpqTAKdFLWtAJO7
	 fUghJMwDKaeYimm0HACG41ibGBeKcqSuigIH2qQBifeappwaKHHWXzwdHrWdrWcvZkvh6
	 Bv+hTKzV7Bvyw/DB2LB0RX7HdBh89aq3LmINpUxU/7gHvUxyJ1UkYZKtZIg68SznRWg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mkFiWi5W;
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76D691F000E9
	for <tools@kernel.org>; Sat, 25 Jul 2026 13:46:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mkFiWi5W
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 76D691F000E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495590dde14so14033075e9.0
        for <tools@kernel.org>; Sat, 25 Jul 2026 06:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784987207; x=1785592007; darn=kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:organization
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVSGJgFUGEoODitIUtO+q4Qxb838k8VgnVRdsNHa/AU=;
        b=mkFiWi5Wd6TK5OfvhLOVo0V4Pp6Pov+wgqElm357ScwBHvvb4Ci5quI2/QPGN/VY0c
         d15AMNJfFsm5wMXMCVGQbXrMrdZEm40yOj65jW0cW5lSWKhdC6hcyZugTsRM22p3oDBN
         wtNuwa97V43FDBA5d6on/1N7ThS6tR3QerBXP2u8+oEHUqtU9u3MI0McWUIvM1p3DbiH
         cCWjDlgf7+bjFkaX7GNk6AlAFu00DkEN5lARAWELxqgU3hgBE5QJjDak1o5spXLwEZhQ
         8IDK6yFkx3hHWRsoI+GUsG8SOiIYkQDjmUG2ai7xegf743iXO1INxr444CGQegdA0YUy
         pF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784987207; x=1785592007;
        h=content-type:mime-version:message-id:date:user-agent:organization
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVSGJgFUGEoODitIUtO+q4Qxb838k8VgnVRdsNHa/AU=;
        b=sh9lDTl8UwDuPG0J2zmcP3FU3YHRtuCO5lwpxwFW9Xm/+IEJlCwUTcFBLRgMCEyFtJ
         tsSfDj28NeP5VPpLbqA9llgY/lcQ/V2YgwGObZBMQL5Xxv54020ArP53pmpVYzpdAaOA
         444V4w2cRSOIN/Hf0T1niQiA1AcwSoGgluqa6xyBBbf/leNCOWe+qjWHqd7Scy/7tBMI
         FirB5AuwD9INSBkOCIX3oFbI/2dcaa/1lRk3dnakBPjVYW7hnDCzLLzozdZ78VycUTtY
         IDh1G9MvmmS48TC7HDZIv+iYUoKbK837y2SDzBAQOL3tTDL4wKG5pkgSkLncbS0tnz4s
         RfoQ==
X-Gm-Message-State: AOJu0YyH0gvTibl03CTCH9RM7uHftrtMc64Z4VbrU8AJIxakX8DteoJc
	UId9eAnl61a77SZhJFa7NYNrdj9sY/vbJhVtk3dcolIpJxLLsb31fbreovjDa9UEvV9MfDHZGfe
	jPQmIRIPl6Pmq
X-Gm-Gg: AR+sD11WPiks0RH4iKrlfDZ9SBvqQ0amndOkWeB+qG65H9SJWartxX7JCupq/Hhp+zy
	YHhU7aCsKfWWiUi5eYbX/fVZkeCx6ku2J1XL10EiN4gvdw6wcnuamKaJwTY4e8XYD9kzmfcHh5J
	H5Vfzb8TUSORpEQxAq8YsWhQRKV1bEK4mQlx726ZjVEB7NfQnetIRQ8dROoGv52okwwsULfhnno
	vEXb71bjjWOoztlIVK9bBcQ6dKoOd92gNPY496DhrcQTVMyjLd5Qwyb05okBB8VDsiFbnquv8Wu
	PVvmchGDSNuH4YpJIrVb6/CE4u5uX/slPg5mIBywrkNqjieS/ftqMRL9P5D8UCz6EZZqNNGXi3S
	BdkeakEjMGCxb4XMHZc43ubVpsPb5YtTDSK5jI85ZXTkwCHNjmTxZWR3YbdOjO3N52bUuocCGtC
	7oPe/ZBnDTH6OSstmWYFFF09qabVZHXmDllikTfA==
X-Received: by 2002:a05:600c:820e:b0:495:6478:2dbc with SMTP id 5b1f17b1804b1-496b56e6e2bmr25871685e9.6.1784987207174;
        Sat, 25 Jul 2026 06:46:47 -0700 (PDT)
Received: from bst (178-223-23-251.dynamic.isp.telekom.rs. [178.223.23.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4eecb4fsm65005675e9.7.2026.07.25.06.46.45
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 06:46:46 -0700 (PDT)
From: =?utf-8?Q?Arsen_Arsenovi=C4=87?= <aarsenovic@baylibre.com>
To: tools@kernel.org
Subject: b4: DKIM 'x' causes BADSIGs on otherwise valid emails
Organization: BayLibre
User-Agent: mu4e 1.14.2; emacs 32.0.50
Date: Sat, 25 Jul 2026 15:46:44 +0200
Message-ID: <87mrvfdvwb.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all!

DKIM signatures expire, due to the 'x' key; see
https://datatracker.ietf.org/doc/html/rfc6376#page-24

dkimpy implements this check:

    if b'x' in sig:
        if re.match(br"\d+$", sig[b'x']) is None:
            raise ValidationError(
              "x=3D value is not a decimal integer (%s)" % sig[b'x'])
        x_sign =3D int(sig[b'x'])
        now =3D int(time.time())
        slop =3D 36000 # 10H leeway for mailers with inaccurate clocks
        if x_sign < now - slop:
            raise ValidationError(
                "x=3D value is past (%s)" % sig[b'x'])
        if t_sign and x_sign < t_sign:
            raise ValidationError(
                "x=3D value is less than t=3D value (x=3D%s t=3D%s)" %
                (sig[b'x'], sig[b't']))

... thus, it seems to be impossible for 'b4 am' to verify signatures of
patches sent more than ten hours ago.

Of course, this makes sense for a compliant DKIM implementation, but b4
frequently verifies emails long after their delivery, so it can cause
trouble there.

Hacking this check out of dkimpy works.

Reproducer:

  b4 am --allow-unicode-control-chars https://inbox.sourceware.org/gcc-patc=
hes/20260709164046.2207585-2-aarsenovic@baylibre.com/

b4 and dkimpy version:

  ~$ qlist -Iv b4 dkim
  dev-python/dkimpy-1.1.8
  net-mail/b4-0.15.2-r1

Have a lovely day!
=2D-=20
Arsen Arsenovi=C4=87

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKoEARYKAFIWIQT+4rPRE/wAoxYtYGFSwpQwHqLEkwUCamS+RBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIYHGFhcnNlbm92aWNAYmF5bGlicmUuY29tAAoJEFLC
lDAeosSTV1gA/1EN/JhuNWtzNXCwTlU8neBmmBB6UHc6jOC3rgPnsfdJAQD4XSd9
UZbGOlP6J8NOQKI2E5ZAPa5VQUOVUDr0e25DDg==
=CGmh
-----END PGP SIGNATURE-----
--=-=-=--
