Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546973822B3
	for <tools@linux.kernel.org>; Mon,  6 Apr 2026 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485436; cv=pass; b=mYvsFrWZwhF6l92T1wHECmA5oWvCfbTFKU1EAKpVgMagvi8hGKOusN0UiZu2qoWtOu/VLrzLyfB4pjSKrZbXmD3bP5eEPqsV7fTLcFbpVlUGQmZom4Ow1FaoEQW2+WwDiliNtVehPieomlV9KYHyquhbqJ4PJbUKqrop6Zr2Qy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485436; c=relaxed/simple;
	bh=iM5Y4aCeRZG6Gg40qg4tmNnLG4jydDvVsSVQrWTEUK0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=J9guSzyvJBPmw6TdFBRV4sCbjml0AuFa5tbiY6xSqb8gf1QnAB3qVg03o7VO/8tr06CEwdT4BDe3Pu/ES64X/RnZT2K+crQ4a8WAeu0T2RWT1Z0poA5zp5i/nXgGU1GeS1DydzJClaA+/0LqFxLqbBY/2rnjZTnpk8CqtLVfpR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TK7xae92; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TK7xae92"
Received: by smtp.kernel.org (Postfix)
	id 1833FC2BCAF; Mon,  6 Apr 2026 14:23:56 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67571C2BC9E
	for <tools@kernel.org>; Mon,  6 Apr 2026 14:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67571C2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e09b14102so4412831fa.0
        for <tools@kernel.org>; Mon, 06 Apr 2026 07:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775485434; cv=none;
        d=google.com; s=arc-20240605;
        b=bT/AYUNRjPH/kQj2nFg013n+5EA8p9QYylHJ1ReX6XWTOan27kHZzi1QB9McjiwL2X
         bS9tObGaIEGfZ1jV8JBNllrAzBJhNLw8tkqxHHJvwj3w07RE/jt1GF/X3cJSpHergf2y
         suNmgyl7I4FpnC/fP+Up+D6+LXBlqDEnH/sdDOrJexz3HASq8K2qc7JMdDndsAMoJAt5
         lfPiNyBzA/sowZYvzOJrwwLnev5GtjxDXo8p2RqEdBU93vJfE3aQDYFrqxWE4wqBZ1Ko
         nlZIIJDFa6t98OBbF9sJ5PBnmJmOTCBkZDBLMMQPMOJEfDrYL9BTp3OAiM3j9C6MsjYv
         qQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=iM5Y4aCeRZG6Gg40qg4tmNnLG4jydDvVsSVQrWTEUK0=;
        fh=Y8uXghslmjxXUh3zaIlzq/UovjRyIym6la5zIjPZdRY=;
        b=j3trGGODPle5baFsRZ/Pb95bOende54wbgHdFaopMbje1qaZaKzY8UvyU4krg+4wnM
         L7YwUVhT4CCFNIn3kPm6i00mmvfmImWe44fnKqpA+YUG7rljvtt7EkK8dBrGiRmqrQgp
         u0OR1ipIlbI9Innka0l3SbRiq3J3XoWuQlmt5ttNEXU5uESgNw3hpGoNEuFvWuqa97p5
         JpqrDitZnuRNyCazyM2O9WYhL7ug9AHJLfvt3xeDbGip34tR7jgYs3xkeTdQch8Ct50o
         1R4pRoLpSJWfPSp87m/G2uKSx6u3Wk/NZ2tQHN08SOibxZKLFihQa59oj9Pev9yDSYNH
         b6lA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775485434; x=1776090234; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iM5Y4aCeRZG6Gg40qg4tmNnLG4jydDvVsSVQrWTEUK0=;
        b=TK7xae92HMkNNhZcaZ8lwiNLVO30HAJ4YbzmnGgV+GS92ktxr5OAdSejulyezXVYyL
         n55DtSjBtaECWisDp4FthEQjlO5NhBWHN/k+ML/hJK+6Dc7ioCIei3Frkaya5eJFwWt8
         zRTHXHaZO7AuYVWAg/JzqKwlQrGazTwjjTk672xXNCXLkwACnmuhHjgmxy7oSg6ybqyB
         OI5cG6f9n1j6cKNMpqYmUGsH056HWFXWvxrVzBFBxYNzyZdpD4mqOwPowfEDbLnlBl7U
         6PZ5Keh8W30+KhrfJAuuJAtoRInZG8+hybu9EwfH3yhKqQdKNMom9SK4+Kxznu633yJq
         6kYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775485434; x=1776090234;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iM5Y4aCeRZG6Gg40qg4tmNnLG4jydDvVsSVQrWTEUK0=;
        b=p7g6j8orcoo2FtA+mIjbVwstJG6oaRjOhdCuiC8ZtpTECl7Qh59sUIsbSmyZe6QqKv
         ciKygmVTXZVKVwVMapRZ/a7oqS2yR/dh82de/UDHA0ecWIOVzCEv/S2hbAy09AVfFs6s
         j14KLJ6n0dWLSx6Yq9UBYFdVwBcsRo+WtEci8nazJmkQI+Znb6lnkQpugy+q9qvmkjPJ
         135q4ElhdNBxt2g93BG+Jeqv19f0TuYlto2DXGabxA0wiw468AooTL6vCmyFBMYY8Opd
         t64JzUrHxqwI38z+jxyCtkL0G6evQsZpruX3jBEbngNomxA0Rfr76Nrb3C98128B7sSk
         5FUA==
X-Forwarded-Encrypted: i=1; AJvYcCXGOqFD58Xp2sNi32MvBNFMn1S7eWvw169Hf9cC2Y20rVIR0Lnt4vWDxOPi+38p7aqjQvqSKQ==@kernel.org
X-Gm-Message-State: AOJu0YzRD7c4PTwlzlxQ76yiP2oYCzcQ2Y8AFpqwwT74B+pI66G7JPTn
	iyICsFDmr6dZQWEN3FFPlU4DF6/F+5SusgHLNISYuZFgXgk/zRadPzHI5yzIEJdU80kOwCbe4O2
	fQiNJy3lT8KzLuaOXt5dMVO7PjdOWds2lffsAkig=
X-Gm-Gg: AeBDiev0LJDJVquvpL3Z7FO3XhZW3JBELtvycd4bd+PIOz6hAMzpkC++fU92r/TwHIv
	As8gdCWglq4tby2wJz5rILxxIkK5maU+h0fWWAtQpsWlbKJ9Sgz+EVuOPfAfzFsAlCdYQgO1JXq
	0ACKWKm8kO5UT0K/MtKRLtqm0Q28OhmT24/PsITRYElMIxJDW7saMzlXvZiOOiHLZghhTqdh9/6
	J7PNoexT6avRvQzfKkvGihMnGRpv/OMGi+tdMxSdhhDHSgpDvV0DRlUxeCr1ckwmJKMfk1/t4sH
	3vtW46DlhHGdahNmivKteb6riSYuzxiRFIV/F8aepkMchRriXfwiIZiJzka4hfNDS7z9nJRnhWo
	oDGEJHgDKTFrMwECVSw==
X-Received: by 2002:a05:651c:110e:b0:38b:e048:57c with SMTP id
 38308e7fff4ca-38d91d793f5mr37286471fa.7.1775485433245; Mon, 06 Apr 2026
 07:23:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 6 Apr 2026 10:23:17 -0400
X-Gm-Features: AQROBzBNVJKhkRVc72TsSUxIRSk1ZeLLUjaVQ8YQD00Qx5I58Rg0vlOVcxrgtaM
Message-ID: <CAJ-ks9=De02zhrrrbqEO3wUCzBazsiDV8vgpKNKD7=mVUBomCQ@mail.gmail.com>
Subject: b4 review state is broken after series reorders patches?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

I reviewed v1 of
https://lore.kernel.org/all/20260405235309.418950-1-ojeda@kernel.org/,
but I was then unable to review v2; range diff failed with `Could not
find series v2 in retrieved messages`. After some hacking with Codex I
got this working. However, after reviewing v2 (which only required
replies for three patches), the send email dialog offered to send all
30 review emails again.

I suspect this is caused by the series having re-ordered a few of the
patches, but I'm not sure.

Is there a way to attach information to this report that would help
you understand what's going on?

Cheers.
Tamir
