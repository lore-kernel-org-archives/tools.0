Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565097;
	b=xL+o6hNtJqKa48rIvMuhgbPQO9RbsP6hCMJRC+CMCTdTmY3CIpjGt5fIh81McY4f6J/8
	 NWM/y2SDALntEuqe2A67MzdMOxoWEhdYtBFzYPbNKXGNxZQkCpQ614CH9zJikUrUCaux3
	 fObMHZAq5DazUEOBCRAp5glGvOetu8L2d85jeqR+BOo4/cLDOVuOu6slPXQOTv8ZFnnAV
	 XOecPJr6IRKz1pS8lOkvlN8YXOYwC8A89oxzrq81A46FVtzdKyXnnDr7tTWOWJqIw6fTF
	 qSwe9UCX0rawrpszbWQdE2AT4uEN78KyC32/eahH4OxyyUZC5uLhUTb7Isz1QibG6mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565097;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=JyFJumVh76CsR9zj/QfD1SV9faNp1wQEobjT1t9cs7o=;
	b=RIiLNv/tIlUXdLavM2dWfY/qdswP686EdErm5NnMrk6ZGPilCDDn5wl7xYtGGn6NKBr2
	 f0rDnLl1kCwoYBYz9Xf+pQ2P9JhO6T0EhVlGxJuo7ac4wQuyE5yK8M6Cou3bm5nbwCPhr
	 h5ZI+3KjQBfTe6JaQ6hfviqxUwdcegZBe6GRpboONTfs0Tjmo2ILDZi9ci/Tn1gL30BPh
	 qO6dFnB1xqV7sAknRKJ/ZdCNLj0D63aQeS+fDS8YpPH7uRC2/usJh6W76wFRceBz4CA6f
	 0MfTvbgURXlq/U3hUpbsecLruZFqUY8jFSfNVH5xxy7yIEquhWksak6/3FU2n5mNdBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tMwHIkFU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077E3606A31E
	for <tools@linux.kernel.org>; Wed, 25 Nov 2026 00:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tMwHIkFU
Received: by smtp.kernel.org (Postfix)
	id CF47F1F000CF; Wed, 25 Nov 2026 00:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6806F1F000C4;
	Wed, 25 Nov 2026 00:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795565096;
	bh=JyFJumVh76CsR9zj/QfD1SV9faNp1wQEobjT1t9cs7o=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=tMwHIkFU0OeKxXtT7qaUNjxzSpGcgrAziPul2gkroZVxnY7H1jUDqTg7NpkY9YPvD
	 VZ7UF95E3P6Qhs/B554UHZFTeoFFFBdntS5Mo00Zg+i0TWEscAqSRCTXKs1Bsz/kgq
	 2N/Mx4L06irRZLFipnUuLvbAq67/c60eKxjWGPKQ=
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 0/2] shazam: pass series URL in env variable for git
 hooks
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261030-am-env-vars-v1-0-ddaa12797156@bootlin.com>
References: <20261030-am-env-vars-v1-0-ddaa12797156@bootlin.com>
Date: Wed, 25 Nov 2026 00:04:50 +0000
Message-Id: <179556509032.2933355.4811203055083152759.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=5eelWTisW8043aAOqKduyPXYjsIoHaBZu4cvPsgnihg=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZ1JTDp3/4eMosoDF2X5Gn3YStCp0KplaGASa/smJYn
 oe3Gs/oKGVhEONikBVTZCnbF7spqPChh1x6jynMHFYmkCEMXJwCMJFDyxgZDih/a7p9d1/a3cPO
 772cOnj82Fg2Cud6TZ/0etrx74de6TEynGWqv2h4MYPTK3/3lcM1V5T2ui5nb+PzEjBVL5C4uGU
 5JwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> This series adds support for passing extra environment variables to git
> commands run with git_run_command(), and uses that to pass the series URL
> to 'git am' when using shazam.

Thanks! This prompted a bit of a yak shave, but things are better for
it. Your series is in, but with some significant changes:

  - Patch 1 is not included: master already had an env= parameter on
    git_run_command, so your patch 2 uses that (5aaf35c0).
  - The variable is B4_SERIES_URL everywhere (the commit message said
    B4_SERIES_LINK), and it is only given to "git am", not set in b4's
    own environment.
  - It now also works with -H and -M, and in the --resolve shell, so
    "git am --continue" passes it to the remaining patches (fdf0b6d1).
  - The docs example is a plain post-applypatch hook that uses
    "git notes append" and does nothing when the variable is not set.
  - Testing with such a hook showed that b4 could run hooks twice for
    the patches before a conflict. That is fixed for git 2.46 and newer
    (3d2cabf3).

"b4 review" does not set the variable yet -- I'm not sure the notes
workflow makes sense with it anyway.

Please try it out and tell me if something is missing.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
