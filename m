Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB8D2DF3DA
	for <tools@linux.kernel.org>; Sun,  4 Jan 2026 20:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767557458; cv=none; b=h4HS3TY4H4ZD2poSovvFPlhGaXVI3aCfPACRH4tuDOB1Rod+s4fnkYuGh9LBiXszQuk6OCKgzN0m/9OJWZN6royof4cU7VLZ3M6FEyRYdZgOp/hOwYo7pAdew/iUXoqH4Pcz/OEY/1zepvhjXAUI1dFX3Jo75y/Nbkj8aPhr3aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767557458; c=relaxed/simple;
	bh=LUga+wzcftbafSb9VpSJgJhH/asFDc4H9V2TTh5DFtU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=O03NRQ2jDP16P14QRScj8YoOef4XrdVhFaNwjELtea46vFC1lPVW4+Z0/oHkcYYZVnfRRm7g7g1PU6WTmmBJYbUOdjxJdhDkA4ihSMW6c/ERtBEPCALtXTpnRwG8qWuU313lT0sw8xmGhA4fmh0ElLo8eotb9WSInTH35/ZHVHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNVPkuLn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNVPkuLn"
Received: by smtp.kernel.org (Postfix)
	id 29B25C19422; Sun,  4 Jan 2026 20:10:58 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E72CC4CEF7
	for <tools@kernel.org>; Sun,  4 Jan 2026 20:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E72CC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34eeffdb197so1255644a91.1
        for <tools@kernel.org>; Sun, 04 Jan 2026 12:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767557457; x=1768162257; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qOmu087cLY23lI1RKUB3oKXD6jAN8FIgIKWQG4zpavA=;
        b=jNVPkuLndv1JXkbLZ+MmOOcnXU9+prcvZbahxI4J6IFuc7NExaHsL7H1T1Zloy2Yqj
         8OIvtJfdmieJX1+v5NpKOP5UoB1rf+OnoXYASntZwvFuzJPu1/qL2yUGslO5Z5Y6hVdi
         4Xf1TvirFBFwmjNuMPLqCTRF0KUjuK0iJ5B7y27zITv62zHvKfOTUNF+QoRURIF587TU
         gm+CENLNMX7tBwjy78wbvgVHyPetNKcMgBq55EiDKIl//3spTMNEk71Y3zD2OUOKBgnJ
         vdtyNvtGYUG4z89O2j2xSQLaZdRjuQqVam5OBfqryElrt3RL/9VFGS1+EpbKhEaqp0LM
         EZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767557457; x=1768162257;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOmu087cLY23lI1RKUB3oKXD6jAN8FIgIKWQG4zpavA=;
        b=m/nfIrHz+RiG3wBiKqDy5sH8AaKlsG4v2RLUq0uTrrC95RIfGoAuOn7ZPd9YtmWi10
         gZqv03Kq4E+eTas0LPjzj34sSrFzXSY+LsvRplhC0ONm5TTvBvBaFvpAWvJhsk05xUrz
         KgWhECrent6FrY2euyn9+RzcOhmvLEMkA6PIBUaMyRjdhQyPAKSMimNfn2R+GilTEE12
         +HDRYvq4rmW9up95cRpxmhT4bxmOmMjfHiXO176YDoluGhTa85kfhKfdwcK/35fDhL4Y
         ayy9PtKBnVYzJvX1wtLmDLKZXRoVvYFLRYIQEyeuHZ6EdYvvJ4gcEy+iVGkrHUzKukFW
         zz0w==
X-Gm-Message-State: AOJu0YzPXin7pynAnlvy2jOABLhiFPXg8alU6zHis54hmNgWhS7F6AKp
	HUGDU5qp+lZ/iprTBpZMvB2vrYJ8JqfvI4RhZE2VAjTwILCusKA4GfS8eqAiYLAT0MCp1qil7wR
	qiSEDRpejObIO+mUCU95KfGx5udzRFaYzHVLec6s=
X-Gm-Gg: AY/fxX4dqam8CYHbsVLFHvqGZWOY7vEKuL3xAODOn3a0YhMLC6b2/LbNyXilnfhPZJI
	G7bmJTmFU/qG2TmZIvZTiNIFHTXXcC1+eedBFGC35Ke2NYvz1MDzzg56Y5HGRQd6yC2yS3ItjOb
	WCIxdg50h4Qq/c6W6+8E9FfADvVXr+B1nTpkKOinUA2wVYWUrqoMoIXG4ZM+7pYI8S3XOKHzQD4
	u+Cw2JY7geaVl9hoXO2i+Zo8Yx5PR6v5yJSmhZN6D/ZAy04dkxQ5XebjUH1TuCiMPb76ivljH1n
	vw58E8GCBm8Owqao4L1OOtXvthik06b4byFBJkJCX6AHoCIrIUryYknKD2yJsTKw8RCjAEXvI+t
	fufp8qRiXUJc1
X-Google-Smtp-Source: AGHT+IHDglnLCjU6jkMMYsTlhMdtkh+Q3Tvl0agXVOsdEnO+NrS+JeErpn79/ds5EB3kDFTmH1F3UxKS2j65MwZa3nA=
X-Received: by 2002:a05:7301:6093:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2b05eb9d4e5mr22351735eec.3.1767557456516; Sun, 04 Jan 2026
 12:10:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 21:10:44 +0100
X-Gm-Features: AQt7F2qDkoWw0QQ-zDKLNsD6HbySRi2sxX9pmAIBDMeKKXmLxQKi5Mwa1RuW6Kw
Message-ID: <CANiq72nLuYfoVnWGjmEmUJDKSpFJq9wUXfTND1e3cjwhe0KFFQ@mail.gmail.com>
Subject: `b4` drops added trailers with peculiar patch
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

I just noticed that trying to use `shazam` on:

  https://lore.kernel.org/rust-for-linux/20251201165601.31484-1-atharvd440@gmail.com/

would not add the trailers, including Link, SoB, etc.

Poking around inside `b4`, I noticed that the patch has an space in
the `---` line.

The message is probably considered broken, but it means that
`get_body_parts()` will split unexpectedly and then the trailers will
be added after the `---` line.

So, later, when `b4` uses `git am` to apply, they get discarded
without warning :(

Would it make sense to try to notice potentially broken patches? I
know that kind of path is fraught with tears, but two ideas:

  - Double-check that the trailers are actually in the created commit,
and if not, sound the alarm, because something is not OK somewhere.

  - Perhaps a new case in that `if...elif...elif` with a pattern like
`^--- +\n`. Or perhaps even an `else` that warns if things look odd?

Thanks!

Cheers,
Miguel
