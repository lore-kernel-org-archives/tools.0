Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5587C139592
	for <tools@linux.kernel.org>; Thu, 28 Mar 2024 19:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711655955; cv=none; b=DcVTJsU5Jy1n4XuanUVczz8r/uiSZlwx7Gh/rNyWFLOMKb0uyJaTzaugmSMfupGhnQplkJWWZj48hQYoq4pXCFUXdb2VzHrHO3RVk0l9OV4za9SfYEmrzp6oWXZxwobJkweK28c7od0zW/Hdvck4rj4A/ftbxFqoMylSylPkfwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711655955; c=relaxed/simple;
	bh=czZiHrHOGVOgroDcxWxJz4Cqy4xsSn9FfjPafp0I6No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4gFYPr+wXxb0boUzXX4VZIB9SJ4or8UTTwBh5E6BHKPKbCTXs1duVVzsq2vPM66xZL7ciumR9N1PsWkEzWJ3eOg1nrHzr6C/NTofEExqgKsRgd1owW8iXiOe0ePWZwmQgWPNjVRgVG/EBF0FTMduxaM9S65/hjPMNSBXGBnfSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlhIoKJl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlhIoKJl"
Received: by smtp.kernel.org (Postfix)
	id 04016C43390; Thu, 28 Mar 2024 19:59:15 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17385C433C7
	for <tools@kernel.org>; Thu, 28 Mar 2024 19:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17385C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso1015542276.1
        for <tools@kernel.org>; Thu, 28 Mar 2024 12:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711655953; x=1712260753; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=czZiHrHOGVOgroDcxWxJz4Cqy4xsSn9FfjPafp0I6No=;
        b=SlhIoKJlKTmHTJcuf31Dxw2+EknC8cdgA+kNNlN7XwoyyD02GztPAznOycjk9loiws
         Xyd5SdzG6jd1TpvjVQGnqWft2KsWg3lK2dkOJixHlDZxmhNPtzfWsA50Hl3o3J2Bwoqx
         tn2Uiy1OcERWxdrti4SFICpoDcovVULIi7PZRw3S6PrHZGX0n+0d9WW8ZzaCSwi4lRaW
         ulya25iMvA+SW0Z4dbyA/gyrjmBD+0Zn63gL0OYprvbx5Tf6JX2g+XK8uPkOyHYE8c6Y
         uYe5PaQSvyB4TlY+OFSzr/wRKP4gn+NaDniK8HJmOvp55baMJyzP9dUpCCtv4dXk3x7C
         346A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711655953; x=1712260753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czZiHrHOGVOgroDcxWxJz4Cqy4xsSn9FfjPafp0I6No=;
        b=pEzyHKvZ+BLJuCIGyObr5t112f3e1RUCeZTyLaQcFfzK7/yg9l8qP5mpDTcJEWtpyb
         rf3EJ0pCgvQ5WLfQ5d4Pf04fM4cFsjSwchgQgwxCqCQGBR/rxhz1AU3cSixI4HZtz1b1
         PH5YXbMYUlmc6eyqHOi57qND71P9X5WgfNI5qKtlqR9cepsp/aRGIeByxUW8DSSV7kvZ
         RSgJl35P2DEq6FlffyxtRNQ+lxqC7yaTIaHAu2a54GexGyQ4ixPsCr8JBptpYs45+YLx
         4VYl1UJ4nNBFEzYZOLNVxYvr9pTApBGrEACILQqFeO8OHZT8tZGX9u3/kOWbXy3jqB4e
         89Sg==
X-Gm-Message-State: AOJu0YwNhrPm08NtGgAv7Mwq+qHBglX4683YGLHUluYYOQcmbaI7oycM
	D1GxTKrDo2B5G24jJUfr46XtSvLytPLDeKuyqcUz2wEYRcxH5saQveMHsN0KksZA3fIYIQs8bby
	KILTprRpfENlLfnbXFSD5GK4LkjQ=
X-Google-Smtp-Source: AGHT+IHdEPxE8ieSijHByJV63ngN3aVeOQsENZv5w79vshXiINL7kGqnfPwaPQqamcRDg9vglS/ZyYJuPopqeoPxnsM=
X-Received: by 2002:a25:6e89:0:b0:dcc:467c:cecb with SMTP id
 j131-20020a256e89000000b00dcc467ccecbmr361060ybc.37.1711655953101; Thu, 28
 Mar 2024 12:59:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20240301-shell-completion-v2-1-741c88669859@gmail.com>
 <20240305-obedient-centipede-of-finesse-a35a86@lemur> <CACvgo53keELtth1xAapQD91EDrZrdK3XVVeVSVE+NX1cygnn3Q@mail.gmail.com>
 <20240306-crouching-notorious-toad-acdafa@lemur>
In-Reply-To: <20240306-crouching-notorious-toad-acdafa@lemur>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 28 Mar 2024 19:59:01 +0000
Message-ID: <CACvgo52+Unse1ZCnSaVTNDJWqURgoqLswKbQhzxFWKFm7HW7Dw@mail.gmail.com>
Subject: Re: [PATCH b4 v2] b4: add shell completion via python-shtab
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 19:35, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Wed, Mar 06, 2024 at 12:03:31PM +0000, Emil Velikov wrote:
> > > My preference would be to go this route, because it doesn't create a new
> > > dependency on shtab but still lets packagers generate and ship the
> > > tab-completion content.
> > >
> >
> > The above solution can break in a number of cases and since there's no
> > CI, it can lurk broken for a while.
>
> Yes, but the same is true for any number of other things. Since this is an
> auxiliary feature, it's not really critical in my view.
>
> > - path changes from src/b4/ to ...
>
> I doubt this will change again -- I just did this as a large breaking feature
> to make pyproject.toml look less insane and I don't expect to do this again.
>
> > - parser function is moved from command.py, or command.py itself is renamed
> > - parser function is renamed
>
> These are possible, of course, but I doubt they are likely to happen. Even if
> it does, since it's an auxiliary feature, I don't really worry too much about
> introducing this regression.
>
> > Does that seem like a reasonable argument, or do you prefer the
> > standalone script approach?
>
> I still prefer to go with the CLI solution. I'm going to commit the script to
> misc (giving you proper attribution) and we'll try it out.
>

Ack, thanks for the patience and for landing upstream o/

-Emil
