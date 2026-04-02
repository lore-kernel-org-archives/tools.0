Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7723138423B
	for <tools@linux.kernel.org>; Thu,  2 Apr 2026 17:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775150194; cv=none; b=plZDHaWLLKqXamYcmvdSisU8VTyjJd4i4CjxOv5P36xlG36QV2O093TUYi0t+nbSUH9+uSZ2SCMkpH8vHKvO82aFo2HHsbjIJBe4G/FXcFeIZrqsnF/iPQ8YP8IbSkVR/l9MWHXIEyM+V0LyX0DkLtC9zLQT3CNz6abgxnfwcPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775150194; c=relaxed/simple;
	bh=Tq1i4YAHxvINlmPbxQ0E8bNT/IPEM7cxafmMiOFLp3Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=sUmAQEJd2K+gRIfFiX99gOTVs9EvodS6+eogtZnC5LXi8xpHxgmLCXZgJWjs51mleiLTR1XqgrgaiNRqHXk6kdGWChMEupRJ0TT8fOo5mEwEiIP10XW/ix44YskohEbFSvVj8lqm5psJHna3pJyKJjyOij6+6BW6kHKYxLGcMVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1bd4kZH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1bd4kZH"
Received: by smtp.kernel.org (Postfix)
	id 59398C2BC9E; Thu,  2 Apr 2026 17:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7FCC19424
	for <tools@kernel.org>; Thu,  2 Apr 2026 17:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775150190;
	bh=Tq1i4YAHxvINlmPbxQ0E8bNT/IPEM7cxafmMiOFLp3Q=;
	h=From:Date:Subject:To:From;
	b=M1bd4kZHrCswS652c7NQQFsynPWoVpTVSsZF3+A7ay4sWMK3MjbHhJlTDKzYjGFER
	 ZvOWqVPbo0/fMABjBklsIU8nkIOqL4Xj4Uv/V+z6Oo6BdCVeEj7n6iaUy0q+wAAZTp
	 wvk6TOxTg3IgHWxVGKMrX/dZzQ5ceHwOVmUI5zAscv0HkaKaQGANBcn0W0sOJjIff/
	 2uO9cCp9x52elBSdtCsNLB5YuJzhB6cGCe1gpVcXHYimQnwXjcZ++COLQtCvBMVdi8
	 7DETMAsjwFVFWCFDtSn/MpoJA5umrtRt7ATizDXSd/ITpaVAwAhuvSIoqugfFwly83
	 8Id3Pr7SpxX0w==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38cc8708d76so9549691fa.3
        for <tools@kernel.org>; Thu, 02 Apr 2026 10:16:30 -0700 (PDT)
X-Gm-Message-State: AOJu0YwQEFFGp0FvMPzUSv0xiVQDszW/sIASbt/AyOyptBeSb/qmlpvt
	4weRl8x8qM6EWwyH4r1mprnOmSmTuITA/7rTTfHIWTohvC0QMNBVdv2dUgbXoIyV1Rbkm2Upl+P
	sHZ78xWg2Sbj5bplaoRxFZkqooc7Ee3E=
X-Received: by 2002:a2e:b993:0:b0:38a:5102:9190 with SMTP id
 38308e7fff4ca-38cc3089324mr21050581fa.28.1775150188900; Thu, 02 Apr 2026
 10:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 2 Apr 2026 13:15:51 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9nyNcqk0LPdCsir1i8=2FQZEEVRx6fTW6FWsCpiNDbJvA@mail.gmail.com>
X-Gm-Features: AQROBzCVCI6JugZUstJ-xSvAJgrcu56H_M4Jbgof0tIZTSZlrxD8Hsgt5f3XJnM
Message-ID: <CAJ-ks9nyNcqk0LPdCsir1i8=2FQZEEVRx6fTW6FWsCpiNDbJvA@mail.gmail.com>
Subject: b4 type checking
To: "Kernel.org Tools" <tools@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

I sent some typing improvements back in June 2025 and I see you've
been steadily pushing things forward since then. However, when I try
to run `uv tool run mypy .` on b4 I get just over 350 errors. Is there
an invocation that's expected to be green?

Cheers.
Tamir
