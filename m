Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1591C42F559
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 17:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817532; cv=none; b=jJRS0SVOlZQGpi+Ee3R5m5lOdKn1nJB44b0li3nA6DvEYMalzaHf8zGlppFaGxJFiFG79Ro/iOIpzMyZ5z79i3EhMoQaWFHePEsGfY7BTADQ8ItMbxxpBRwkdk7p5bjMtkRywV02WHWcvhW4gKxhJujXJ7JMtSG9col8fg2/ORQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817532; c=relaxed/simple;
	bh=2AGUwqL31GZccUVD65fjN1sfHGl3GEq1pqLA9deTH7o=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kGU/2dzM/JqBbmYhHKYdAuqVihYkTl09vBHUB2l11LYGC3Rr6p+DslG65X7vTmf3YENJYdGudRLs4pfnC/D9i7rRhE+iuGkZkI8z+TDPm+2XJTpkeHCJTEegVMzmW2n0aZPT9GspKwnI62zJ3v+cOnCPFFGq5SckCIRVWge9ycw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=U3encrFU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="U3encrFU"
Received: by smtp.kernel.org (Postfix)
	id BF667C19425; Fri,  6 Mar 2026 17:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EB7C4CEF7;
	Fri,  6 Mar 2026 17:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772817531;
	bh=2AGUwqL31GZccUVD65fjN1sfHGl3GEq1pqLA9deTH7o=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=U3encrFULnuvZaukW5c7RtQ1Kg39tPCM1DGY3shywQv95HN3Wn+nHhJkPbKNjEY/n
	 mDX6ZG7Be1myyJnkWjqBhpIz6db+0oFbXbk07Wd5ak8xv1nytVDb24JNRzWX/Ofp6w
	 Xk33Ojkcoamjs/21cedGZPg85Smp18U1marIJ2dY=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] b4: allow using xoauth2/bearer token to authenticate
 to SMTP servers
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tomas Melin <tomas.melin@vaisala.com>
In-Reply-To: <20260306162020.54683-1-dtor@chromium.org>
References: <20260306162020.54683-1-dtor@chromium.org>
Date: Fri, 06 Mar 2026 12:18:45 -0500
Message-Id: <177281752583.2015423.2312633416921696209@lemur>
X-Mailer: b4 0.15-dev-129ab
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=2AGUwqL31GZccUVD65fjN1sfHGl3GEq1pqLA9deTH7o=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGDJX81R5Rxp9uLnM8/a0xQzXq7auDy3kPLQqad/8zENrZ
 1yurums7ihlYRDjYpAVU2Qp2xe7KajwoYdceo8pzBxWJpAhDFycAjCRZ1MYGZreX+3N4i9Vu8vy
 yDdnXtuhDo6PYc7/3Ncryf40ipLdU8TwP3h9o8DkWsbMwirBuHvzMtxfV7qc2tBgUGRmIxP1taW
 ADwA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On Fri, 06 Mar 2026 08:20:18 -0800, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> Allow using XOAUTH2 as an authentication protocol and assume that when
> XOAUTH2 is specified the password is actually a bearer token (typically
> not stored in the config but rather returned via "git credentials".
> 
> Recognize "oauth", "oauth2" as aliases for "xoauth2".

Hmm... we do have another series already for XOAUTH2 support:
https://lore.kernel.org/tools/20260205-smtp-oauth2-outlook-v2-2-6a5eb233b285@vaisala.com/

However, it's outstanding with a few requests. I wonder if we can take 
this one as a first patch and then build the other series on top of 
this.

Cc'ing Tomas on this.

> diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> index eab290b..9a5d25b 100644
> --- a/src/b4/__init__.py
> +++ b/src/b4/__init__.py
> @@ -4331,7 +4331,11 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
>                  raise smtplib.SMTPException('No password specified for connecting to %s', server)
>          if auser and apass:
>              # Let any exceptions bubble up
> -            smtp.login(auser, apass)
> +            if smtpauth in ('oauth', 'oauth2', 'xoauth2'):
> +                auth_str = f'user={auser}\x01auth=Bearer {apass}\x01\x01'
> +                smtp.auth('XOAUTH2', lambda: auth_str)

This is what the agent tells me about this, and it seems valid.

smtplib.SMTP.auth() calls authobject(challenge) with a positional
bytes argument when the server replies 334 (the XOAUTH2 error-detail
challenge). Because this lambda accepts no arguments, that call
raises TypeError, masking the real authentication error.

Suggest:
    smtp.auth('XOAUTH2', lambda x=None: auth_str if x is None else '')

This way the initial response (no args) returns the auth string, and
a 334 challenge returns an empty string so the server sends its real
error code.

I'm happy to take this with this fix, but I'm also going to wait on 
Tomas's thoughts.

Thanks!

-- 
KR

