Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13FA175A80
	for <tools@linux.kernel.org>; Tue, 10 Mar 2026 07:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773126645; cv=none; b=AxWAEm+W8jSFDeM1cLqSIQJ6WLRGKemdxmxe5PdRnJHto6m6uZZ0S4k9dxqsaFH1g+ppsU0/te/l1D5uI7U20bVr84RGKtUwqxvAtOPcnZwKdhd+VKZSC6KPuF+iuJg8Y0kfzrzbAwpLO4HqXViX7vu0+eFSLRYORlYJhFON0mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773126645; c=relaxed/simple;
	bh=ozxCuJWguFzTX18/Y38LPwRu5DERvpjj8Gzm5i/ntIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9V5TwUpBmC8f4ZIhGRY4ydgqYBh5DqAlU19OGwARNBSYI1wUYbU6SnlPTypk4l3v4XkY2LZBmJPKAQ2xi35muN0j5uKSUJMkojT4i+GBCKJFksYcbawHjgu19mB0DupTT87qYiiUl/j+13cTyVDWitjz5sNaSjPbPHdGbQ0CD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a47isvZt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a47isvZt"
Received: by smtp.kernel.org (Postfix)
	id 663BAC19423; Tue, 10 Mar 2026 07:10:45 +0000 (UTC)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A390C2BC86
	for <tools@kernel.org>; Tue, 10 Mar 2026 07:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A390C2BC86
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-126ea4b77adso15429704c88.1
        for <tools@kernel.org>; Tue, 10 Mar 2026 00:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773126643; x=1773731443; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HJWTL6dwiG7/gpQZTQcL4LZg3PPOj1R+fR5mfufFZGo=;
        b=a47isvZtcXR8nlqvK6FwuFrPlDWRqifBl8D1/Ebbb5jF9wYxBsdX9r1b2l/hJdvC4f
         yH2AqgAsVvdhzbw5a44S8QgOhFM6gIE1RmntB0VeV1t0vFdoLXPTvaUC+Ih4Sa4o8iQY
         ML6tB0TxMe5kqGa5ymaa/qUXItGndY+EN0wKKrsp2tB2QH/8r6lSip1WJERx6Ih6y7ax
         fYDL2PpGgLumSqv04d41f7lby+u09/w5VXFn6mQ+slsKWxqC/FBN2A/Q7BCXYSVSM8bX
         KxvONvIDLEhEV3YPJTzO5FDgPWcGp2aWaBFnK6I7btqrTi6s2FxG1SlKILSjsZ5Ef5wO
         s0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773126643; x=1773731443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJWTL6dwiG7/gpQZTQcL4LZg3PPOj1R+fR5mfufFZGo=;
        b=XWIpAiZBQvwYlRU7HCxgTIbqGZTaB+LToEtQ2rulE59v8kxLu0C3GANLm0r0N9kVVr
         eCpFr2PHHwjrrE65el1arapemcPBRNsXprE/My85CADts4q6KFES2T9t8Qmev+Ra9TK3
         XA8UMEHxYAGn/o5//mPB2dCDkACEekT64lJi4jt10kNDKGqOZhUbAWOLxJsFTujMORvU
         pEXwSgmnSgBoiNUj59wO6zTt/sTSOVRJddOBSRWQeiOPuRWs/aTfhXQidaJH+L5gHJsD
         1L901U/bN3ariAwSCSfffJQfMPFpFf2yFoRBgwq6xeofpGiFKWzfseIEQernSZIrIDGW
         V1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWswl6O6dh2sJeNigJXjiC/izMHKpIOKISN5A4q37+vl3RSHMjShjHzcPunzyGcBaA8vyhV2w==@kernel.org
X-Gm-Message-State: AOJu0YylyA3+IwbTFdBf1fHWFPM9aXkexiA92vTT2yOBRiZdGLq1G/C9
	QuFEZni/rgOyZ9PYdeJ0O54oA+s8qJ0YRu9o1E3IVsKcM/ns1vXE8594
X-Gm-Gg: ATEYQzzgIAzJJTxwtyScuQUkqbJw0DFUoO0YHjqEcZr0yfz+VzeZwFZCfT/fos5IcyP
	gRVju120TMDqu7WreW7OkBWReRsjqwtkPO87A9hafI/Zcq5b84GarrqjnCU3cePr46U9uMZbdFN
	bUnWtJE+cTLFYQQwUIgWI+ChL3cIQBlDuVeSI4EqTUUiVso4NeMKMOuYRRMI/9MT6zkJzT4eYqt
	h+rpx4Q0rcff6QPFLpjvSpOEDcvpBcfrlr0cU8MkyuPc6iquroBjdS1fQuaxN7naSW68LLyHb9M
	r4FAkFY/5lPrhrTIkU8WRxrs9DQIpwKIA+hNLEaOrJrnyY+tRnQgfeT3MnIdf8Io0UkcFAU2zNI
	rsbNoOPfRrSkrUMqMRhmwb0szzbqA7sW/L9T6ZDkistguD5ONx59jzsYy8NPYCglNsZQlkB5bdj
	x1qQZEmB/5zjYX/auHXELHzQigxIHW8LfiLr5nt1cy+LQ+fxLbUFOyteNjQKj519cl
X-Received: by 2002:a05:7022:619c:b0:128:d2f2:5cf8 with SMTP id a92af1059eb24-128d2f25ea7mr3528271c88.34.1773126643366;
        Tue, 10 Mar 2026 00:10:43 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2a0a:17c2:21e7:dcfb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f8481c1sm13269409eec.15.2026.03.10.00.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:10:43 -0700 (PDT)
Date: Tue, 10 Mar 2026 00:10:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomas Melin <tomas.melin@vaisala.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	tools@kernel.org
Subject: Re: [PATCH] b4: allow using xoauth2/bearer token to authenticate to
 SMTP servers
Message-ID: <aa_DpKoL7co7FALp@google.com>
References: <20260306162020.54683-1-dtor@chromium.org>
 <177281752583.2015423.2312633416921696209@lemur>
 <aasPUY9XWOBy96rx@google.com>
 <56dc34c8-c63e-47c8-9ea7-4420d71574f2@vaisala.com>
 <aa54CjijJk_1S4dd@google.com>
 <466569ed-7b4e-4ab8-a6be-3c5379fc3544@vaisala.com>
 <aa77-EczsZt2eRln@google.com>
 <dd4ed10a-2648-4ac5-9df7-6c453114a820@vaisala.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd4ed10a-2648-4ac5-9df7-6c453114a820@vaisala.com>

Hi Tomas,

On Tue, Mar 10, 2026 at 08:48:55AM +0200, Tomas Melin wrote:
> Hi,
> 
> On 09/03/2026 19:13, Dmitry Torokhov wrote:
> > On Mon, Mar 09, 2026 at 11:50:40AM +0200, Tomas Melin wrote:
> > > Hi,
> > > 
> > > On 09/03/2026 09:49, Dmitry Torokhov wrote:
> > > > 
> > > In your case, how do you provide the new token to git credential?
> > git credential itself calls into configured helpers and the helper does
> > this. You do not need to replicate this logic in other places.
> > 
> > > How does you .gitconfig for this look like?
> > global  sendemail.smtpserver smtp.gmail.com
> > global  sendemail.smtpserverport 587
> > global  sendemail.smtpencryption tls
> > global  sendemail.smtpuser dmitry.torokhov@gmail.com
> > global  sendemail.thread true
> > global  sendemail.bcc dmitry.torokhov@gmail.com
> > global  sendemail.suppresscc self
> > global  credential.helper cache --timeout=3000
> > global  credential.helper local-helper
> > local   sendemail.smtpuser dmitry.torokhov@gmail.com
> > local   sendemail.smtpauth XOAUTH2
> > local   sendemail.bcc dmitry.torokhov@gmail.com
> > 
> > The local-helper is a custom python script that behaves similarly to the
> > gmail credential helper, but the difference that it supports different
> > credential stores - either based on secret storage API or GPG-based so I
> > can move my configuration between a headless workstation, a VM, or my
> > laptop easily.
> > 
> > The beauty of credential helpers is that if they do not know how to
> > handle the request they simply skip it so that the next one might be
> > able to resolve it.
> 
> Yes, indeed then this looks like a cleaner solution to the authentication
> process and
> 
> the approach proposed in your patch should be taken instead of my initial
> attempt.
> 
> FWIW I tested this out, but for some reason I was occasionally not getting
> the
> 
> token back, instead it falls back to password authentication prompt (which
> then fails).


Hmm, this is weird. I've had the setup with the "git credential", my
credential helper, and "git send-email" for the last few years and I did
not observe this issue... Maybe one of the helpers is flaky? You can
call "git credential" from a script like this to test:


#!/bin/bash
#
git credential fill << ENDOFDATA | sed -n 's/^password=\(.*\)/\1/ p'
protocol=smtp
host=gmail.com
username=${1}
ENDOFDATA

to see how reliable it is. Obviously adjust host and other details as
needed.

Thanks.

-- 
Dmitry

