Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0CC32D45C
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773761228; cv=pass; b=e+/LCnp9091DkhI/GMjeC3a4K5suY/MNQTtGCm0jwsgcnifHPZiy+rOuWV9X+hDPxq8H7xZfubzLVkO9g6JirtWUdxnFY1pRg5MV38cWvoHRQk1n4hZIatKSw39BLLKLG2ZVUlmUJ5o0jNVwzmRNNkmEpF4yECWGWYZ8WTx0jKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773761228; c=relaxed/simple;
	bh=rWKJbnE1ORVx6krQkBEjhGrbfBBOYYauIdQl72uWBec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtU+Xc6eiB7MWC+vTAJkjTvIrDfIkJUo23oDxg1VyHS7IDEVURMTkWmIfY3oFp+fbl8y0ASETYzawy+atPtO/cHKWgSs1gahtCjok4jQLByIVuECJ0EH7ciyvA7I5Qp6arLHOQ9TaDnURvB1q18gfb/vaGxCtUED6NksZmsuqIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=AG56j0Je; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="AG56j0Je"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so2231884a12.0
        for <tools@linux.kernel.org>; Tue, 17 Mar 2026 08:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773761226; cv=none;
        d=google.com; s=arc-20240605;
        b=GFFvpINj1m89jbPnY4REQ3h23mygmnRa6Pay0wq9cnT/2IYbm9kFHwpwUoVHBr3k5a
         DrqYlV31/2TPSyNSZAVUrZjBHVYLT4qBfdVceiAxZ+RR2vqPb2dCKulWUdKFQjnPUHzp
         TX8H8LaIkxVVCMzctIdn+0oh7zh5OAVP98tM3xR4HuoAYElynLMvmaFlM1T3kq0Lg5YG
         cGlrWxO9FRGIlZW3m2jMQM9NGgoOWAMWB1EeKmARi/LS5DrgLXEk0Xn3VKdAV9ZWSBxj
         w/Szxqn+p55yDi4xQ2cNSS+cYY9a5jRijbUKnQt2M0ZavrlYg2i6sKaHwadJMO1Q4sOE
         8pfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5q54ms+bEbGHdxc/2JCs4Ws9Nof7MGHs5cF+RM34mxo=;
        fh=SYzEM1Bz9HIe2u202Hfn6JYViaLmEddcbkAzexyXF6Q=;
        b=XMxJqWmfHn/Cmkz5uEJWjiKIRO017j+Prs/F1zsfTIN1PY2exoq1/ByuM/B/gI8vSm
         9Zjv6z0px2RyfbSxqhAXCxzup0A+rFVoE8X+dRfVcAW51qOmFmQRDxriu7lTGL+w1yXW
         gfqJjl1Ts7ohEqIdnHDWY5d4eMOqsNgr04hv50oXJ8Ni249kM8h6o0Er4DKAm6s0CAS3
         Ae0Icis9u1zlJzH+2GT/nk019r6AOJz2gPPmmQ9KS4z//JWORNqBK0fo4FSC11XnS0Wg
         I47BhKVPFUH85rd2olsMXfrKNu0yeHQt2dVsShs8uSkPqFlgkNgmPU6rSgUCR2CZAyyE
         TapA==;
        darn=linux.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1773761226; x=1774366026; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q54ms+bEbGHdxc/2JCs4Ws9Nof7MGHs5cF+RM34mxo=;
        b=AG56j0JeFNFlrSiNFLUNnJfGKzbNvxlFG8QysMvm4MH8wQGAp35GaRQQPpXWpv3azQ
         RVsvPvchEvCLg55p1LK06Zvx2wnJ/1bMm8n8RDT0XlPlRMKYvoW/F0hCCsJydAPhiN1R
         VGXLXHEFk970oLguIgZGse/bmn4k6PjB4Xs0o6HCUdNqknSAEO0iqzZny6yF06zG95iI
         UBFvoP9Qhr2TXvbtDdqcvIHhKYIob4LzjtKAECw7ZOS9ot/ZdIUBMQfYyyy8xsxATGq6
         QzzR9xtyFTV+nTHDUREEuhnhy2r4+cbFcgy1ldZYQVen0HZcyYhyUZmX1/HjiAo8hT1j
         5woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773761226; x=1774366026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5q54ms+bEbGHdxc/2JCs4Ws9Nof7MGHs5cF+RM34mxo=;
        b=GODLYaDLTPGSO8n4QQf/c1v8PbCAkl0EF6pEGHaCcKZivi2L/XnhKhoRpAhUeTCPSd
         LMlFawf/xzrwnSE7pLNfDbDkR/x198pHIwe+ZiFgq7pnySh3CPZzQc+n81IfOLFuOhua
         0OCREjyELFk4+0TiJSwerXU42UXU47rzR9Sh+JSN1G4lVWESG6qqvH9kRZ6A1m+lusSG
         +uSbNH+51IKudkWWveOivR6Q+uCyiw/nF84gURsxMRmOdwdhgTWZQgGshXv/oHWv5DnL
         H3Jh9mHGfTe2VtMz0WABeP/0kLnWzWhvA5ereWDnnd6HirxojLFTtU1Ih9Zp07eEXeYN
         yDxw==
X-Forwarded-Encrypted: i=1; AJvYcCXU8gApva2A5rDZUPiIh5i49cCMfgTbHkrb7O88Uz/Y9Vm3FKbY3AreFB1SSKjRUvpGppJWIw==@linux.kernel.org
X-Gm-Message-State: AOJu0YyfBLbH8ZBPeetKOqUbPtpJsuyPohnI8R+mxNfhvC+p5Gg81CMk
	rTuQNdJg42yCw4iD2b12W1QNNSCJUxKmuZKlKgx/q7wxAR3Vs86HhFChnwDngAbs9MoJlMkY7/z
	YRqy3h89l6RUpyWB/gS88mBCpsFxCtsY2iMTowIX6
X-Gm-Gg: ATEYQzx5ACJnoGkgmnyt0mj+rh3fWAjWLigYo11tAtQUEjsYMmxAn6/kXaARKvIGHiZ
	QxWUKVSzg28QFqP3enqQ6b1X9nR7iqd/3JeCBptJQS71DX9oLeXXJGEdKWwvSMyavl6J+1adlao
	j2rZ0hvZheYcEf8tyEfKxrkpIL69bkNNVrrDJ7nrUY5Kq6BuiVj3vLYLmUk4MNhqN05pwAnttdj
	r+//CpppAemPJ+BJPVnf0b4r14JSVRKOs6gBY9HvwIQV7kD+PmnTp7xv6aBMWY8gML0rB1/e6Pc
	4u7uvTw=
X-Received: by 2002:a17:90b:4a46:b0:359:f6f8:57b8 with SMTP id
 98e67ed59e1d1-35a21e37d7cmr14288536a91.1.1773761226244; Tue, 17 Mar 2026
 08:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAFMMQGt-Dc4DiSNUYR1mQfUBswP9bmjyXfcvuy6HO57rZ79fHA@mail.gmail.com>
In-Reply-To: <CAFMMQGt-Dc4DiSNUYR1mQfUBswP9bmjyXfcvuy6HO57rZ79fHA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 17 Mar 2026 11:26:54 -0400
X-Gm-Features: AaiRm53fnzVtd37OG0jjhMkdlwG7Wzn27qWBEFGIE-U3XuXVv2BlvzAwLLGk_VM
Message-ID: <CAHC9VhS7nBWxZ0=1c_ec=Lq+J0CqZUGbriu2i==X7FciSw0K2g@mail.gmail.com>
Subject: Re: Using "b4 prep" with Stacked Git
To: Chuck Lever <chucklever@gmail.com>
Cc: Konstantin Ryabitsev <mricon@kernel.org>, users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 11:08=E2=80=AFAM Chuck Lever <chucklever@gmail.com>=
 wrote:
>
> Hi Konstantin -
>
> I'm a long-time Stacked Git and b4 user and I'm hunting for a tool to
> juggle the many data items involved with posting kernel patch series
> for review. "b4 prep" seems to fit that bill but it has some issues
> when it comes to large cover letters with Stacked Git.
>
> The branch-description strategy is the least-bad option for StGit
> right now, but it's fighting git's design -- git config was never
> meant to hold multi-paragraph prose, and there's no way to tell StGit
> "don't print the branch description in stg branch --list."
>
> A file-based strategy would solve all three problems cleanly. Something l=
ike:
>
> .git/b4-cover/<branchname>/subject
> .git/b4-cover/<branchname>/body
> .git/b4-cover/<branchname>/changelog
> .git/b4-cover/<branchname>/recipients

Fellow stacked git fan here.

I do something very similar with my own scripts/tools, and if I could
offer a suggestion based on my experience, you might want to consider
some slight naming tweaks to support multiple cover letters in a
single branch.  It's common for me to use a single branch for multiple
revisions of a patchset and being able to refer to previous cover
letters without having to go to my email or lore is very handy.

This becomes easier if you include the To/CC, subject, body, and
diffstat all in one file.  My cover letter tool formats and keeps the
cover letter in a format that can be quickly copy-n-paste'd into my
editor during 'stg email send --compose'.

> I'm asking before prototyping to see if you've already considered this
> idea, might have another idea, or might have something already in the
> works.

I've built up a collection of shell scripts/tools built on top of
stacked git over the years to match my preferred workflow, but I
wouldn't consider them very pretty or something I would want to
support.  However, I'm happy to share the basics ideas/concepts that
I've found helpful :)

--
paul-moore.com
