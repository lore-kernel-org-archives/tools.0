Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8558E41B35A
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 17:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772818532; cv=none; b=HP3+0No1GQe5/ezD/Zt3AwppSgilvIo8TT75Hh4M5x1ihOO36UXmv8WcdJoqa5OeECC0OQEIgkGc86EPKGrSTTq/oR9CfSWTOdBNeP/eCfTHF97tsiBHfT5xjGHDm/JpJCOmlebMc04qmed0V9CtLKFM9s7uaXgT8wfFnN6PD+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772818532; c=relaxed/simple;
	bh=Uuop6C/FXbEh/sB2fXxBZz41jQuEy2yOQoM6J/1Hr0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3T5uWmhUbdJwRFnAycqnxwu8dMM3ty/8Yim7HvxpbKhw74lLILq8NVyqJmZRMIc2UmfS2LysRBR3yJS9ipfce4g4mQLDrHSBlQUM86mX3eAYoLDBAPrTmyxR/yY1yri2sWnmBAMrxxxdNcPqTUloaaIJbrhUS/sH/Q0Z6eJyDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKzVFrHa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKzVFrHa"
Received: by smtp.kernel.org (Postfix)
	id 3228DC2BC86; Fri,  6 Mar 2026 17:35:32 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62ED3C19425
	for <tools@kernel.org>; Fri,  6 Mar 2026 17:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62ED3C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b4520f6b32so10863013eec.0
        for <tools@kernel.org>; Fri, 06 Mar 2026 09:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772818530; x=1773423330; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EyMmpG004IIBQCg9QYHEDM9aB8BbYCfkpP+BeYpVOyM=;
        b=GKzVFrHai7f0dfp+52VHDH8Lwnl2ExpQ2HCDMyIOUn274Fun2manVkR9vCOJ7E/scw
         kaEdKfJBTz3W56EJ1Xm/oKEbwKb1SQ/ErCkDHiWF4+qsdxnOV5dKbouuMrYhbZLZ3hFi
         vdWs+to86r+wBNEAn4PuC00HYIkMi79BpfVSTma/kGASoI6wHF9fE7WoK4D1VIG4zoLC
         hl/VuvXH0qvNiZ4QAAMK1WH4Vj5NHGClrr7qApBE/lR8qRVFRmR9nM1GI33VIpdullSK
         DQUQl96gLk9Cci7+Rdvajz9Xpq4e1oZfY9D/Ri/jlV2yvR820RuX4hrE3vavBje7np+w
         3/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772818530; x=1773423330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyMmpG004IIBQCg9QYHEDM9aB8BbYCfkpP+BeYpVOyM=;
        b=TxqYcApYH3BwC0qjO5UIAgAeC9Q+ah3lrGk07wBngN/0NlNmjJSL+zoTzQuCuz1WTe
         lzLOoeyKWoUt1prVzFX9f6kZ8NwYW5smSB3Sz3hc1qLPHQ4LRZzlWRrOx7grK2VF88P7
         IOEqPLvnrYGX1SDPKKyYLf3UX6YXeu7QTI/3kGHwbFrbe+1t7+nWhl3qC/RUbkKNsvZB
         pUobddLfSohkfp42eKNrkJn4AAMGdFQeGVBbbavZmwpsttEzussR20m+1EV3mrpPXgc8
         h6T02CBoHhBMRB0N+BX9butVVn4iLiWfdTpuMRx/VmGGXdxTkfbOuLVQBDcQtX6RF+AA
         twUg==
X-Gm-Message-State: AOJu0YyrwMr9PgoODWPdQszSlAnMXkZBg5whgH0prcRpsHEoi5rNNVrd
	V4D4d8Sy/J2P39MHtB0GFq9UruWMYP8c1DIMQUwLa4ji8QppIbTk09as
X-Gm-Gg: ATEYQzyx9hFyOSpx1VP9Z3frUcvBUoBqAfCJRif4sShYS2o9OHhZHHzT3V7umZBrT34
	weJIDMpCy48kH+zfVrDM1UdBt9epE1ygOziJMHfJlhn7r3cieTwBey9Ap6O3Oy0sHg2ofztsggE
	tdKQb+RoBu8QlCkd2BLPxeRRcBmJi0DpBvbzhnlLAztZSd9t8CRbXi+dd5q1m9P+g+KkbwPioWo
	HOk1HVCQmn60pzOdPbt/B0I5VGmW/DG7kp47CLlLbguwt7cJ0cWnZopiGeyuYADGjDTX5tMroth
	XAqdiDJ17MNnbll377SpUdeF1MjMbgWsXgUQ0DTyCq9OmFAbjStYYxuez8+k84llZOAvMhuZ7dd
	S6T2OcEwWs3x03njY48nx5U5XuZ7oeuyImkJfaQMpoUpk31Jm0ckPgyTXpjqKdDCymrDhMHyzgz
	qqdC4UcWYDl3JCdgUHjWX+qxTYHel3jByHd3rKNXVwRnQzh6glh0Sy1oaYLZG3sWO5
X-Received: by 2002:a05:7300:cb15:b0:2be:969:75f3 with SMTP id 5a478bee46e88-2be4e08f997mr903805eec.34.1772818530216;
        Fri, 06 Mar 2026 09:35:30 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1554:a973:4eed:d1b1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f82bc72sm1553450eec.13.2026.03.06.09.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:35:29 -0800 (PST)
Date: Fri, 6 Mar 2026 09:35:26 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, Tomas Melin <tomas.melin@vaisala.com>
Subject: Re: [PATCH] b4: allow using xoauth2/bearer token to authenticate to
 SMTP servers
Message-ID: <aasPUY9XWOBy96rx@google.com>
References: <20260306162020.54683-1-dtor@chromium.org>
 <177281752583.2015423.2312633416921696209@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177281752583.2015423.2312633416921696209@lemur>

On Fri, Mar 06, 2026 at 12:18:45PM -0500, Konstantin Ryabitsev wrote:
> On Fri, 06 Mar 2026 08:20:18 -0800, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > Allow using XOAUTH2 as an authentication protocol and assume that when
> > XOAUTH2 is specified the password is actually a bearer token (typically
> > not stored in the config but rather returned via "git credentials".
> > 
> > Recognize "oauth", "oauth2" as aliases for "xoauth2".
> 
> Hmm... we do have another series already for XOAUTH2 support:
> https://lore.kernel.org/tools/20260205-smtp-oauth2-outlook-v2-2-6a5eb233b285@vaisala.com/
> 
> However, it's outstanding with a few requests. I wonder if we can take 
> this one as a first patch and then build the other series on top of 
> this.
> 
> Cc'ing Tomas on this.
> 
> > diff --git a/src/b4/__init__.py b/src/b4/__init__.py
> > index eab290b..9a5d25b 100644
> > --- a/src/b4/__init__.py
> > +++ b/src/b4/__init__.py
> > @@ -4331,7 +4331,11 @@ def get_smtp(dryrun: bool = False) -> Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
> >                  raise smtplib.SMTPException('No password specified for connecting to %s', server)
> >          if auser and apass:
> >              # Let any exceptions bubble up
> > -            smtp.login(auser, apass)
> > +            if smtpauth in ('oauth', 'oauth2', 'xoauth2'):
> > +                auth_str = f'user={auser}\x01auth=Bearer {apass}\x01\x01'
> > +                smtp.auth('XOAUTH2', lambda: auth_str)
> 
> This is what the agent tells me about this, and it seems valid.
> 
> smtplib.SMTP.auth() calls authobject(challenge) with a positional
> bytes argument when the server replies 334 (the XOAUTH2 error-detail
> challenge). Because this lambda accepts no arguments, that call
> raises TypeError, masking the real authentication error.

Right, I guess because of implicit initial_response_ok argument to
smtp.auth() when I tested it the lambda was called without arguments and
the authentication went through (with gmail).

> 
> Suggest:
>     smtp.auth('XOAUTH2', lambda x=None: auth_str if x is None else '')
> 
> This way the initial response (no args) returns the auth string, and
> a 334 challenge returns an empty string so the server sends its real
> error code.
> 
> I'm happy to take this with this fix, but I'm also going to wait on 
> Tomas's thoughts.

Totally fine with me.

Thanks.

-- 
Dmitry
