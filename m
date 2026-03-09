Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3FB296BD7
	for <tools@linux.kernel.org>; Mon,  9 Mar 2026 17:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773076417; cv=none; b=TDJFY4ovgyE5uxhnvuCPSpTVX/KXC5H4bhqrlqBYKHsHFG93rQ7z/RB/DqVhe2g3HvqurLkvQv9RIKGrxPUeSRfxXTo1VmXf4xpwX0aSATnn5kilz8D95nihAb9AInCQRFONq0W1Sg+Cb7Jc05PamvcotnlBJdlZSBrR1XlP1Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773076417; c=relaxed/simple;
	bh=9422kZZ6RqTBU8GaTUL6yc7vxlhaqBLn5i3caF2MD34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkTY4qEG28IE9Y2bffbSsYGvvHy+CqTj9beRzFQkn+GCuhPCDRjCK4UMAvF3ivnkGUaj40/s112pVOuN7C0TSSIE2FEttKfUgvPMSfoglZXCQd9xlHBjEoy/4eTjA0bokwI4AZC4rycw6NJa6++pUF1z2HKWZWpTtSzk9PKXG8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFLjWrDW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFLjWrDW"
Received: by smtp.kernel.org (Postfix)
	id 9B438C2BC9E; Mon,  9 Mar 2026 17:13:36 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A69B0C4CEF7
	for <tools@kernel.org>; Mon,  9 Mar 2026 17:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A69B0C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-128b9b7e3edso3167201c88.0
        for <tools@kernel.org>; Mon, 09 Mar 2026 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773076415; x=1773681215; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+lrslNGMhP1W2ccb6/VNvMOblmEDYrQFVatJBeswaEM=;
        b=CFLjWrDWP2apXODIbLwFal3GcDmPhOtRSb40TKLdaQhWTHGdjvDO96ocsjZiOYqXO3
         iCFE6X4b4Px1pDzOd1FL89VB5ejzRIzRBRXGW5snrWOiY6UCU07GmQW4pZUcYT/eYLAN
         AkxDzxfWHSrkLzMprtt9673CafPz0DdPbdN4KlSkAtV52Jc1FUH33RY9qve08hd0GhK4
         oF/Gfl1HAiJz/DtbwbzIQqGbtKGinZXNos2q6p+knUif9ypsV8IZPw0yOV80ohSTbrXB
         cjEcOCZXGy7OhOljpCQxwdwhr4PfNhZY+/Q1l1FjuILwh0NiCPBpLA5ymqT1D32KhOg8
         LSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773076415; x=1773681215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lrslNGMhP1W2ccb6/VNvMOblmEDYrQFVatJBeswaEM=;
        b=ZVJ+bY0xsDXPIIXsLpXLG1RqcA2ARArS+r3UfWfqYNWtJDOSJtVr39O+u8EISUU/Yd
         6WcA+XIisJIhcvL5F3AkdrT6G5JhyGMXb3Agm8Ch0GgCPadl/z8LkZL5SzexiSjtLUo4
         COU8/F7qK4RIBLWabzlVBzp7JBpo8jQL6slJYXkVwr3wGd6pc2yHwiPiwsWtQ1U0ektB
         QVejKzzTzulIiaAqvKnLUJxLNUCa1hgZ+TtWNPsUq42stJHOOvrpuEZs80RHk23+6IEz
         stxi/H/VmrBiK5t9ZE91ERJ+JUJejIGA9WiU+m2dp8MVwU1scK6TJ/UZEbiYPyjEIl2e
         zIiA==
X-Forwarded-Encrypted: i=1; AJvYcCVA88w/1lL4qQ46hSvcUzzCF9qm0zGVDgj5OGHGpRBQNIXL4WftzVWXzWA3Xj7i+ofwuDe3oA==@kernel.org
X-Gm-Message-State: AOJu0Yzu6ebTlCxpxI4Y4JmuFmvK5w9YKlo9Xlr5RN5y/QKNck+dYvMk
	qkz7/9fpySNbS/FyXxSXxexG1hUUIkz6SqmKQ5DANuOzsk9rgZt1fKqB
X-Gm-Gg: ATEYQzzg6q1XivN7lUNTuM0PhIgc50UfIYv6Aa1Q+1cpWfnBL6r3THr9Zocab0+h1CX
	C9Z60o8fW3Z6L7MxTEVkCWXkdLMGKQL+2q1vY7IkNVtEVzCR+27ir1xWs+ucpTbm03opklDtW7O
	T+HCibmUyhcYgHmuXMdmbRuCGeFayp//T3vjmS6o0+WSu7mmZM5BeevY7GLkMsH7M7/YuoTJn4i
	LFwv6Imfc6dncR7EhN1V10IprP/4+HXbSLp9bhUbnJMPJgu6mUhRaSIGa4gCAy2N/8o16qHEruS
	wCVQMoSktEMMJvASrjC2wfLSyjjbF8Et13vfIAcW0jenjHjIrc7cSDMwfP7ByYKNXsO7U9HhNbI
	jE2uXhECuiLATPgsS1udWUegHVbiAY7K3/LZPKvg3yXjpa2i0a0Xzt9RuepAW+RHkWlzvDKA1su
	uqF1IErnvVNkL44hFoLgq6/qLzWr2S5M0jdNQqkRSCZeFpA6RqXerLDfXD7JnR2Re2
X-Received: by 2002:a05:7022:68a1:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-128c2e9968emr5416241c88.26.1773076414461;
        Mon, 09 Mar 2026 10:13:34 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2a0a:17c2:21e7:dcfb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3d5a85dsm9252115c88.3.2026.03.09.10.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 10:13:33 -0700 (PDT)
Date: Mon, 9 Mar 2026 10:13:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomas Melin <tomas.melin@vaisala.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	tools@kernel.org
Subject: Re: [PATCH] b4: allow using xoauth2/bearer token to authenticate to
 SMTP servers
Message-ID: <aa77-EczsZt2eRln@google.com>
References: <20260306162020.54683-1-dtor@chromium.org>
 <177281752583.2015423.2312633416921696209@lemur>
 <aasPUY9XWOBy96rx@google.com>
 <56dc34c8-c63e-47c8-9ea7-4420d71574f2@vaisala.com>
 <aa54CjijJk_1S4dd@google.com>
 <466569ed-7b4e-4ab8-a6be-3c5379fc3544@vaisala.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <466569ed-7b4e-4ab8-a6be-3c5379fc3544@vaisala.com>

On Mon, Mar 09, 2026 at 11:50:40AM +0200, Tomas Melin wrote:
> Hi,
> 
> On 09/03/2026 09:49, Dmitry Torokhov wrote:
> > Hi Tomas,
> > 
> > On Mon, Mar 09, 2026 at 09:28:30AM +0200, Tomas Melin wrote:
> > > Hi,
> > > 
> > > On 06/03/2026 19:35, Dmitry Torokhov wrote:
> > > > On Fri, Mar 06, 2026 at 12:18:45PM -0500, Konstantin Ryabitsev wrote:
> > > > > On Fri, 06 Mar 2026 08:20:18 -0800, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > > > > > Allow using XOAUTH2 as an authentication protocol and assume that when
> > > > > > XOAUTH2 is specified the password is actually a bearer token (typically
> > > > > > not stored in the config but rather returned via "git credentials".
> > > > > > 
> > > > > > Recognize "oauth", "oauth2" as aliases for "xoauth2".
> > > > > Hmm... we do have another series already for XOAUTH2 support:
> > > > > https://lore.kernel.org/tools/20260205-smtp-oauth2-outlook-v2-2-6a5eb233b285@vaisala.com/
> > > > > 
> > > > > However, it's outstanding with a few requests. I wonder if we can take
> > > > > this one as a first patch and then build the other series on top of
> > > > > this.
> > > > > 
> > > > > Cc'ing Tomas on this.
> > > Perhaps I'm missing something but this approach looks to me more like a
> > > workaround. I'm not seeing how it handles the oauth2 lifecycle expiration
> > > which is typically within hours. The other series handles that with a helper
> > > that will update the token transparently as needed.
> > In my setup "git credential" returns bearer token that should last
> > enough for this b4 run. Next time b4 runs "git credential" will request
> > a new bearer token if previous one expired. It is not expected that the
> > token is stored in the configuration file. It looks like
> > git-credential-email behavior should also be compatible with this use.
> 
> In your case, how do you provide the new token to git credential?

git credential itself calls into configured helpers and the helper does
this. You do not need to replicate this logic in other places.

> 
> How does you .gitconfig for this look like?

global  sendemail.smtpserver smtp.gmail.com
global  sendemail.smtpserverport 587
global  sendemail.smtpencryption tls
global  sendemail.smtpuser dmitry.torokhov@gmail.com
global  sendemail.thread true
global  sendemail.bcc dmitry.torokhov@gmail.com
global  sendemail.suppresscc self
global  credential.helper cache --timeout=3000
global  credential.helper local-helper
local   sendemail.smtpuser dmitry.torokhov@gmail.com
local   sendemail.smtpauth XOAUTH2
local   sendemail.bcc dmitry.torokhov@gmail.com

The local-helper is a custom python script that behaves similarly to the
gmail credential helper, but the difference that it supports different
credential stores - either based on secret storage API or GPG-based so I
can move my configuration between a headless workstation, a VM, or my
laptop easily.

The beauty of credential helpers is that if they do not know how to
handle the request they simply skip it so that the next one might be
able to resolve it.

> 
> > However looking at your patch I do not understand why you want to parse
> > configuration and run the helpers directly instead of having "git
> > credential" return the data for you and rely on it to figure out what
> > helper to use and how. It gets protocol, username, and host and should
> > be able to figure out what should be returned. It is not b4's role to
> > interact directly with git helpers.
> 
> git-send-email also requires similar integration with external helpers
> https://git-scm.com/docs/git-send-email#_sending_patches

No, it says that git-send-email makes use of "git credential", it does
not say that it calls out directly to any helpers. In fact, this is
git-send-email code:

	$auth = Git::credential({
		'protocol' => 'smtp',
		'host' => smtp_host_string(),
		'username' => $smtp_authuser,
		# if there's no password, "git credential fill" will
		# give us one, otherwise it'll just pass this one.
		'password' => $smtp_authpass
	}, sub {
		my $cred = shift;
		my $result;
		my $error;

		# catch all SMTP auth error in a unified eval block
		eval {
			if ($smtp_auth) {
				my $sasl = Authen::SASL->new(
					mechanism => $smtp_auth,
					callback => {
						user     => $cred->{'username'},
						pass     => $cred->{'password'},
						authname => $cred->{'username'},
					}
				);
				$result = $smtp->auth($sasl);
			} else {
				$result = $smtp->auth($cred->{'username'}, $cred->{'password'});
			}
			1; # ensure true value is returned if no exception is thrown
		} or do {
			$error = $@ || 'Unknown error';
		};

		return ($error
			? handle_smtp_error($error)
			: ($result ? 1 : 0));
	});

As you can see it does exactly what my patch does: it calls to "git
credential" and expects something resolving a secret (password) in
return. Then XOAUTH2.pm SASL module takes that secret and produces
that "user=$username\001auth=Bearer $token\001\001" string that is
needed to authenticate.

BTW, I am not sure why you are using smtp.docmd() and not smtp.auth()...

Thanks.

-- 
Dmitry
