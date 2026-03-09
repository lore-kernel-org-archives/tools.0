Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CEB236A73
	for <tools@linux.kernel.org>; Mon,  9 Mar 2026 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042573; cv=none; b=Iq6NOXFrUlCaijXfyE48rIFwTToEdK5D7ydIIHD07ICx0rViAmz8zqoltDenqeTM056UPBgk+tXPvewuCG7bpaZb0m5msajxDKU2Fre9EUe/oQoX7HlG7yQ9cbn8BVOwz5FKKhQGvi5DXZeu64UTpCUxboWdBCUC2MoSZGH7NO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042573; c=relaxed/simple;
	bh=tpLWSiKqo1KWTRcNFB11tF4zr6HFcepdlBm/svRB1Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJLSczqiozPC1OL5jAcHbdH861ydIkOYD0IoJTY2/7tXIkgmL/CdPYGYqHOyf5MnKgr1UrNMvEtBgSwFw7nXDoSl6kLLV/iJjYLDchdFzH4S0XKVRi2yFxmBJl77PSKpVMEmfky0JrSA0QQuvskiSO+i1zBgxTS2rGNT6kwx18Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAt2vzrA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAt2vzrA"
Received: by smtp.kernel.org (Postfix)
	id A9D98C19423; Mon,  9 Mar 2026 07:49:32 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA53EC4CEF7
	for <tools@kernel.org>; Mon,  9 Mar 2026 07:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CA53EC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2be4781d2baso6216087eec.0
        for <tools@kernel.org>; Mon, 09 Mar 2026 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773042571; x=1773647371; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R4SMNbbz/LLpQq2MI6FR+zK5APCnS6iVIauLOaLYb5w=;
        b=UAt2vzrARCQEdkSYGyRutfq2x0p2T1E8cX/M+h/E98YIOKouIE0Vq4cwGvBAl1Va6k
         +En2NomMDgBJnOBKFhIQuhZ4YxPdmGR5XdQ+J0q4bNJ8NjhXsWiL1M6QFeciwogiymco
         duFd0gEV5wbl9Z+b2qpblAuMZJ4EKelpQ2KaETfy3y6DqfUujJjjZepN48b5nH8cruOU
         6qnlC10uqbidjCWcVSSte0YeACtC8WUp612EYsoRW7UlrSodPtWyRl3XemUn10UJWcst
         v/kiKQ+J+yuazMCem1MzItp9CeNKVJaSYGwl2htVf2av6MghJztqCZNT3wEmkRaQKb5c
         r/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773042571; x=1773647371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4SMNbbz/LLpQq2MI6FR+zK5APCnS6iVIauLOaLYb5w=;
        b=LRpRePHa/XvcQ38Xd4JF/o+7fdABIoB6KIYQG03lDWFpaA/SIn+kRqh73hIpgC/uLF
         k4HCycry3G84pK4h+Z0AubCTPkIg1P9VTBV3bIZP9F46SHUS99fnHkY7s7qILnechdx2
         1NnHNllJ8YZVzJoHo4T2LainiVymIDYPr28+FFlloOdcJsorKaMoKynoujBrcaq9I/c2
         DWl/NX8+GsO6agRnUkLbXWCZMKhzUVJnCtfVSqzFfHpeZEN3Ax4AmrFJ6qDH4A5EaS2A
         TI0FbZu5pHh7nGXw+uwQI6uVnrpJwFhtcgfHtX7tBoWWIAOWI7GizLAoNh6gbazs8gY4
         hYZA==
X-Forwarded-Encrypted: i=1; AJvYcCXEMmPBks/EbS94ChJBuC6sca+9huV1fYcMYqwd7wIar0p0VnqFf1cnaOpMyXfiIRgZ4g4cdg==@kernel.org
X-Gm-Message-State: AOJu0YyGmgyM2Io8EPwBNxmIBgW3+N7iPRFIh1DAP3JPO/ULpVuVYiaG
	EcdiBmxK16q0zairtA/sqdWdbl8pFyZCv7/uApxo79Nq/d1HZ6f3GohC
X-Gm-Gg: ATEYQzxqtOylVRwCXKe/I9Ys6X0F/I54kM+K9+YkIME3UV7+14aAIdSvf0+yW5PyuEM
	GrEPDqaE4hAlmplEVj7nJR2y8W/ovD/WughYQUtCXXAOrozQ2UPFCLETH3KHkt5i7rQy9yhaPXX
	WXsTAMs3YRzN59ehavq2NR2WNzxAan13Al7ALP9LYvmh/PQ1mWrb+ZzM03aKX0pFTbO1NOnzUTC
	OkHpaXu8UY+HXBwoj7EYESxE0/hOWQcT1IhUi6p+BcH/akk8WuK+MoA8pCZAY1mDGAIwIfqeHkK
	8PeEqMmjZFsMr29YQrY7mtbJS0JuO2vGeOn7+cIArb97e/6UmWR5PGGrMHI8hvx0p8rwPfyq1oP
	NbAxJV8O2asq/BrDg+mFnN/iT5KtZbq3+PPyHHQqN53FR60+9SJu1cy0HxwhVhRLzienXbZulKO
	CdIRc6OsiQsmOk1bOd8uFwTAr+qj4uEuc=
X-Received: by 2002:a05:7301:3d1a:b0:2be:e36:5652 with SMTP id 5a478bee46e88-2be4dfdd740mr4187302eec.15.1773042570721;
        Mon, 09 Mar 2026 00:49:30 -0700 (PDT)
Received: from google.com ([2601:647:5e00:4acd:5040:c742:ca0:29a1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96f64dsm8029251eec.27.2026.03.09.00.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 00:49:30 -0700 (PDT)
Date: Mon, 9 Mar 2026 07:49:27 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tomas Melin <tomas.melin@vaisala.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	tools@kernel.org
Subject: Re: [PATCH] b4: allow using xoauth2/bearer token to authenticate to
 SMTP servers
Message-ID: <aa54CjijJk_1S4dd@google.com>
References: <20260306162020.54683-1-dtor@chromium.org>
 <177281752583.2015423.2312633416921696209@lemur>
 <aasPUY9XWOBy96rx@google.com>
 <56dc34c8-c63e-47c8-9ea7-4420d71574f2@vaisala.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56dc34c8-c63e-47c8-9ea7-4420d71574f2@vaisala.com>

Hi Tomas,

On Mon, Mar 09, 2026 at 09:28:30AM +0200, Tomas Melin wrote:
> Hi,
> 
> On 06/03/2026 19:35, Dmitry Torokhov wrote:
> > On Fri, Mar 06, 2026 at 12:18:45PM -0500, Konstantin Ryabitsev wrote:
> > > On Fri, 06 Mar 2026 08:20:18 -0800, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > > > Allow using XOAUTH2 as an authentication protocol and assume that when
> > > > XOAUTH2 is specified the password is actually a bearer token (typically
> > > > not stored in the config but rather returned via "git credentials".
> > > > 
> > > > Recognize "oauth", "oauth2" as aliases for "xoauth2".
> > > Hmm... we do have another series already for XOAUTH2 support:
> > > https://lore.kernel.org/tools/20260205-smtp-oauth2-outlook-v2-2-6a5eb233b285@vaisala.com/
> > > 
> > > However, it's outstanding with a few requests. I wonder if we can take
> > > this one as a first patch and then build the other series on top of
> > > this.
> > > 
> > > Cc'ing Tomas on this.
> 
> Perhaps I'm missing something but this approach looks to me more like a
> workaround. I'm not seeing how it handles the oauth2 lifecycle expiration
> which is typically within hours. The other series handles that with a helper
> that will update the token transparently as needed.

In my setup "git credential" returns bearer token that should last
enough for this b4 run. Next time b4 runs "git credential" will request
a new bearer token if previous one expired. It is not expected that the
token is stored in the configuration file. It looks like
git-credential-email behavior should also be compatible with this use.

However looking at your patch I do not understand why you want to parse
configuration and run the helpers directly instead of having "git
credential" return the data for you and rely on it to figure out what
helper to use and how. It gets protocol, username, and host and should
be able to figure out what should be returned. It is not b4's role to
interact directly with git helpers.

I also do not see any traces of handling lifetime expiration in your
patch either... Not that it is needed IMO.

Thanks.

-- 
Dmitry
