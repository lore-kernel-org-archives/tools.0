Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7006D2949E5
	for <tools@linux.kernel.org>; Thu, 26 Jun 2025 08:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927068; cv=none; b=lgn75zAUH93cB/vUWa0wlWzV2Gp8jgJ/VX8RTMGROU4nrIsOTIBmukWlJxXj9UgjrMzRA5VmyYDAErw0H+4oV3FDzKcvdXIk9d9sg8luKmWKlieL1oWVSiWgZVAeObJp7cqvU4TmHeDIvY52MfwBaDg/rSPh9niW82tsQSnlrr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927068; c=relaxed/simple;
	bh=61NR3+cv2s+s8non1oheMAZjlDoX1CX3MknyPY6bDPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ply6+H/T4avedmmaWPM1S7h9iPnRmQDpzzdoOrSyHtyvUwdOs3/kV84BNyv/WXmts9RiOH7N3tbIgdTDJUwo26KIjxFhxT+uGCHhvfAa+W2HKp+k8TB3umzwuLb0HnjvyHbj1DBNkM/+9AAwKXMjkdP83K6nnPEUJ7OXm9ykcNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CNJLuMGV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CNJLuMGV"
Received: by smtp.kernel.org (Postfix)
	id 02E80C4CEF1; Thu, 26 Jun 2025 08:37:48 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0564EC4CEEB
	for <tools@kernel.org>; Thu, 26 Jun 2025 08:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0564EC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b7fd20f99so8204461fa.0
        for <tools@kernel.org>; Thu, 26 Jun 2025 01:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750927065; x=1751531865; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LOVSm2lxlfvHzHWNA6nGxFDSpaI7yd4pLz8A6iME9uA=;
        b=CNJLuMGVcxiaViTQl6Eg8aBnCu1YrHiwSpCDJ7s7lw3E/0O1EQ4b1v7LdnPvRTObA+
         FxZR9K4pWsL25ORO55EPWeD6oj3Ml0dZ1WLldSSpAJBMz4IdQ9/oVANjl9QCdsfYSu2i
         wNwDAK7Vm3ZZQN4ikrb9Vnx1dyr6bfwHMkGacur9OhwtK2h4WKkn6K69Wwqj5rWg540O
         ob0LtG9V5Mmc7bkiI8Sh0WxHC+DBHvqPiXaIlkG/u1InLbDnjAXwQ/s3PkCaGn+aq1fz
         17f3aq1ZAdt+1mlXEUa0ulpQVQ/l1v8ceOCv8CBWHK/EOWonEot96dTW/YJ/lmN5VPBX
         p0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927065; x=1751531865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOVSm2lxlfvHzHWNA6nGxFDSpaI7yd4pLz8A6iME9uA=;
        b=hcYhraO8ZAS8uOG2RBhZ2U5KcxCYXkTen9iecHsWz6uKXeLIhn7jZQklNRv5AnjPmF
         G6HICx1tzny7BkIeCMqR0hSt2KjgYzbuI0xpDz2aGomKuZAutnSnajMx4mycSz1cp1nh
         80h2yh1rLDN4T+Y9weYt/TqqbrLPE+/DK/XbMjXtuF5KUkafV7h/Zlt/6Yz9HH4ZK6+9
         HlSN6kGWW/jYxHLfVN2eDrGZdBNNu9XAHC3ZcsLME7+BMRj07jYwudRRIM5hkl4YicsU
         3vDHvBqTBZu+OO9x91FFJdQ9DX9LCqFG5oCFShmxnarzR4LrcoiAcqT8U7+AhRmFAKXm
         yjeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq3krxq4DCCe+RmtIbdf+6WOlSUodoSlNKp8hH9AiIiG8TGJhkFGk103vRleSYSIr4p670BA==@kernel.org
X-Gm-Message-State: AOJu0YzoaJnnnegMrDzwRKxkfquPDeG+GQU6/jEqx9HDcMum8gzoviu0
	CkB127qcL8CeMy1Qdsjnm5GUKGTnhOgF+N6eIcBO9D4pxsqclYoyN/WKLpBJ/lJBoTQQuTshrEx
	6FaUrm4AZAkXwDMwkDqfQ8r01dyCv/2DCjY/ojh0N
X-Gm-Gg: ASbGncsCgpFevV/6GYLn2Ez1HbCZdofOMZiEOiWpm58QirORb99ITcAMz6seGWb14jI
	Quap/FRJ40g1LP18g0HP/Kan3tKjtYWq1Ieeow7Y+9XQG7C/YFh6/yqNCEuHNtwJv0KBZBWellq
	T8KA+RM9D6trznWx5wPkw5LHymVLX9F3O1JE2q1ZL4oxwtKYCNdrz8k0kD70ETVJB1Kxup7jknC
	jV4oCyA3UxTsqo=
X-Google-Smtp-Source: AGHT+IFoce4glEmRfpaGq1cEJXdDdpQIuRzef09xN/mVCcmD+KVlQpUFkduHrAryLe+sJhQ5P60PGjtSCXUKZH3ivEQ=
X-Received: by 2002:a05:651c:4088:b0:32b:871e:9862 with SMTP id
 38308e7fff4ca-32cd0261797mr6223281fa.20.1750927064914; Thu, 26 Jun 2025
 01:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFsE0ogdbKupvt7o@lappy> <CACT4Y+Y04JC359J3DnLzLzhMRPNLem11oj+u04GoEazhpmzWTw@mail.gmail.com>
 <aFwb_3EE2VMEV_tf@lappy> <CACT4Y+b9u6_wx9BU0hH0L6ogGKN_+R5T7OsgJVFAWm8yeD0E7Q@mail.gmail.com>
In-Reply-To: <CACT4Y+b9u6_wx9BU0hH0L6ogGKN_+R5T7OsgJVFAWm8yeD0E7Q@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 26 Jun 2025 10:37:33 +0200
X-Gm-Features: Ac12FXzg-OSj1zle3ASePCxnUdh4OCWuOBwquUmVr7PDJNx1ZtzdOjfrL6XnuBI
Message-ID: <CACT4Y+b1Sou9bzhsuJ_LAjwCtynWN1iNRnaUkkTecNWxLUfMUw@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Jun 2025 at 10:32, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Wed, 25 Jun 2025 at 17:55, Sasha Levin <sashal@kernel.org> wrote:
> >
> > On Wed, Jun 25, 2025 at 10:52:46AM +0200, Dmitry Vyukov wrote:
> > >On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:
> > >
> > >> >6. What's the goal of validation of the input arguments?
> > >> >Kernel code must do this validation anyway, right.
> > >> >Any non-trivial validation is hard, e.g. even for open the validation function
> > >> >for file name would need to have access to flags and check file precense for
> > >> >some flags combinations. That may add significant amount of non-trivial code
> > >> >that duplicates main syscall logic, and that logic may also have bugs and
> > >> >memory leaks.
> > >>
> > >> Mostly to catch divergence from the spec: think of a scenario where
> > >> someone added a new param/flag/etc but forgot to update the spec - this
> > >> will help catch it.
> > >
> > >How exactly is this supposed to work?
> > >Even if we run with a unit test suite, a test suite may include some
> > >incorrect inputs to check for error conditions. The framework will
> > >report violations on these incorrect inputs. These are not bugs in the
> > >API specifications, nor in the test suite (read false positives).
> >
> > Right now it would be something along the lines of the test checking for
> > an expected failure message in dmesg, something along the lines of:
> >
> >         https://github.com/linux-test-project/ltp/blob/0c99c7915f029d32de893b15b0a213ff3de210af/testcases/commands/sysctl/sysctl02.sh#L67
> >
> > I'm not opposed to coming up with a better story...

If the goal of validation is just indirectly validating correctness of
the specification itself, then I would look for other ways of
validating correctness of the spec.
Either removing duplication between specification and actual code
(i.e. generating it from SYSCALL_DEFINE, or the other way around) ,
then spec is correct by construction. Or, cross-validating it with
info automatically extracted from the source (using
clang/dwarf/pahole).
This would be more scalable (O(1) work, rather than thousands more
manually written tests).

> Oh, you mean special tests for this framework (rather than existing tests).
> I don't think this is going to work in practice. Besides writing all
> these specifications, we will also need to write dozens of tests per
> each specification (e.g. for each fd arg one needs at least 3 tests:
> -1, valid fd, inclid fd; an enum may need 5 various inputs of
> something; let alone netlink specifications).
