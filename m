Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C648F1465AD
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741188354; cv=none; b=O4FiFRBLnIv10SYEsqV7zm2kKxfDWd1pwj0n6pd1lFSZr5sBY3Ul5cfMFBwuFwmO+XtFF62BGoV6jutDj5BNc7DSLnlVs7uwKgbcSQfKEgs7IuD4LdR8LBEpSQ1mHo7TUQhhpGEGjX6VOgnNG4Ktyjyn/CU61Ys1Jsibq/fnIJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741188354; c=relaxed/simple;
	bh=PMDmD+SiTkyHRxgwo3VlPioiK8FerDPt567twrHN9gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uj9UbHumP9E5BglD0B3T+ybUXg16PmNU+RcyywL2wg42qWxw8L+wGKKQIcYeKi6t6g5wXkcdfP3Nbd3HwTrl8WQF6z+HYM1effj5+tF2B+xHKuFg6uzhHolWgyDfiBmNuKIGV/mH1woalcMJ/4yteS+65x5nASxWVjqaM1kKF/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=l7iRCfJ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="l7iRCfJ4"
Received: by smtp.kernel.org (Postfix)
	id 4FB4EC4CEE0; Wed,  5 Mar 2025 15:25:54 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AE6BC4CED1
	for <tools@kernel.org>; Wed,  5 Mar 2025 15:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5AE6BC4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e60b04fc3edso5227398276.1
        for <tools@kernel.org>; Wed, 05 Mar 2025 07:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741188352; x=1741793152; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QNjN2cLQoq5BFAOtiTQirpUHfAB8vt3+BkqLsCiF2cw=;
        b=l7iRCfJ4wPnKXbe9XObm3ywAylDE4qnq2jrJg03P1a1CSTFsAI5J1WTP1yszZptkvY
         vGPjqczEUTrzo4/gUa2GhQgWuPmzLnz38BHKDPSpyVdyKR310EofRwYM8cmcHh8Z0Piq
         Z7b28nAq2oxwMmCNf8gs+XO4e71UkFA4l+eGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741188352; x=1741793152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNjN2cLQoq5BFAOtiTQirpUHfAB8vt3+BkqLsCiF2cw=;
        b=EA1fhhMNBemabgS3cCEjTr01xgiCKq9RcIlc62/wlz1smybmHNfq8CS05duKde/TsE
         dC85Foxihv6P8lRjYOjOgYThhzUfwXWAdnUFFKoji1NPr3YftY0wz403lbYeBZhoZDiF
         Z7/w5lSUbtku74gpvkm1iVz18juOmEMq3VHTuEWXkzyq0fYMGuud/Xw3YW/ERrdw0OsW
         bwbLBE8METm1OD+gk/a7bJ3/7phCBWSGbJoRKYXd7tWajs0LykGYkqaSb9mZlRGWJA5t
         b9W/AwJV1XPgYfVKv5rSh7u6BhDYeSc4su4XodxFf2TJI1Ou4LtY2FMgjcmdHmBlloZM
         9sWw==
X-Gm-Message-State: AOJu0Yyj2oJJlbgIyLhdXHFtLLtlhv5fVTazllT7k9iDzEgGVPFdGIBy
	yf6irprkNUO3u0YzyCsvN5g6UgdLKEZxb0Vrj2H8iw4lTNo0jFRsqapRj1tpcQ4=
X-Gm-Gg: ASbGncshUQkIa/K9sBceDBTzo257n3vzALBZu3Fh0KzR746RkBKmO8D6tt6FstRjYwu
	+O22ukBLuxiUDe+xgmPAnYckHbJrlJkWJX9zA8fPwvFjF52FZ61q4gq6+ubjYk5HGvHGpBsK061
	qE6MXCPvZyyuqliHMlyH7ovCU2qU02dfnyljNx64ns8SYzsvHncNJBRZf2F0u428EsgByaCVbQC
	XdwbLdxaKviIeBeC5uEh7vomc58LUEkzA86C4qPmNcW7HYK7HiWVA8CuwskEkaVxh3fe5wEjo7f
	P9mTR0lybiDiCkI6woospYkyd128VfQDs1myGLaaJ4Cvqw==
X-Google-Smtp-Source: AGHT+IFLH25OI35SvOQK51Di7i0qfVow7TsS18+oOaoxsN0fDLU0GYFFs6juFmCs5X4vOOVXLdxL8Q==
X-Received: by 2002:a05:6902:160c:b0:e5b:420b:8dc2 with SMTP id 3f1490d57ef6-e611e1a7613mr4703369276.18.1741188352165;
        Wed, 05 Mar 2025 07:25:52 -0800 (PST)
Received: from bill-the-cat ([187.192.142.234])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e60a3ab1265sm4351162276.57.2025.03.05.07.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:25:51 -0800 (PST)
Date: Wed, 5 Mar 2025 09:25:49 -0600
From: Tom Rini <trini@konsulko.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 feature request
Message-ID: <20250305152549.GN2640854@bill-the-cat>
References: <20250305145121.GM2640854@bill-the-cat>
 <20250305-amiable-banana-scallop-167f8a@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-amiable-banana-scallop-167f8a@lemur>
X-Clacks-Overhead: GNU Terry Pratchett

On Wed, Mar 05, 2025 at 10:01:51AM -0500, Konstantin Ryabitsev wrote:
> On Wed, Mar 05, 2025 at 08:51:21AM -0600, Tom Rini wrote:
> > Hey,
> > 
> > So I used "b4 shazam -P 1-2" to apply part of a series, and then "b4 ty"
> > to thank for it, and then the contributor asked if there was some way to
> > note what parts were applied. Could something like that be added?
> > Thanks!
> 
> Hmm... That's the default behaviour. E.g. see:
> https://lore.kernel.org/all/174109571262.102031.5467613849616675528.b4-ty@linaro.org/
> 
> Have you modified your template to remove the enumeration?

Ah, yes, I did. And I looked around and now missed how to get the
current default template so I can re-do the one I made back in 2022.

Maybe a sentence where the defaults are could be on
https://b4.docs.kernel.org/en/latest/maintainer/ty.html#editing-the-templates
?

-- 
Tom
