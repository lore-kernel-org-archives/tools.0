Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2429633CC
	for <tools@linux.kernel.org>; Mon, 18 Jul 2022 18:26:30 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id o26so9417951qkl.6
        for <tools@linux.kernel.org>; Mon, 18 Jul 2022 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6PN9i+n8DeC51O3miOCJbWGxSkRR6vRe3113dFuIEJ0=;
        b=BfbG2eRCwul5NZtMdZRlUZM8lTfqeGE8B8HeiBYx0J51g9XOgLHylRV0v/6n92V21S
         lTV+v73iERSle4zK3jtGCWmbDaHXoDeHzMq6eznDEpCyOBViAsyMQhLMD1fjvi7aw5U5
         5tYersqMz2fHkqmT1/hLMHSaKcUel6amvwfE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6PN9i+n8DeC51O3miOCJbWGxSkRR6vRe3113dFuIEJ0=;
        b=laeJWlmCD3mJfWzaPtMrBmkLge514/GVrS+6MOiAtgCZ7xrz6W7rL6cY58L8dArJBG
         uTJ6jifL/egfPxHtjDaClAfUMLfmW6fgEBW3G9ivEloYGZ076V94rMZQbTyTyyTtwbxY
         mpimmAZUMmUeMePQ5DT453zlbMAPOj/iEfIgCMLy2vRMOtcZCtrBPVIFv4V9lEne1Ut/
         FbyiBvPorSmtrDNkGvbgz8yxhjvx91p+0dFlp1SC1BNAvBl+Wl/kMrvqAQKlbUwYgQJw
         da4AhYhHQXRb2hxR47w7gWCy9JZJMbJugW4jLbSkcwFCYwlq+SsIqC9H4iVbADwZbga4
         9HAw==
X-Gm-Message-State: AJIora+0OuGvxDgp+ynnd0Z6s8t4laaHt4M/WHkq6ACm9HsrhdB5SVzf
	OW5kG6p1Y+ScdR1kduSXfEfu6A==
X-Google-Smtp-Source: AGRyM1vuM9FqOoPOpXJIV4L4ptT5lj0zA2VuKJj+AQOTosUgOSRbLRVXaS2XBDJ2PbhyUE9Le+JeqQ==
X-Received: by 2002:ae9:e8d0:0:b0:6b5:bee3:51a7 with SMTP id a199-20020ae9e8d0000000b006b5bee351a7mr15607826qkg.345.1658168789089;
        Mon, 18 Jul 2022 11:26:29 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id o19-20020a05622a139300b0031eeefd896esm2850071qtk.3.2022.07.18.11.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 11:26:28 -0700 (PDT)
Date: Mon, 18 Jul 2022 14:26:27 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Maxime Ripard <maxime@cerno.tech>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220718182627.ajyopwr2gqeikxty@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220718084927.nlomzhq3ipni5alf@houat>
 <bd6f5628-1afe-efc9-9c2a-44685d730bfb@redhat.com>
 <20220718182046.GD5049@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220718182046.GD5049@ziepe.ca>

On Mon, Jul 18, 2022 at 03:20:46PM -0300, Jason Gunthorpe wrote:
> > > >    - If you modify actual code (even as much as fixing a typo in a string), any
> > > >      received trailers will no longer match. This is as designed, because if
> > > >      you change the code, it's no longer reviewed (but we won't remove any
> > > >      existing trailers that were already applied).
> 
> IMHO, I don't like this. It means even minor changes that don't
> invalidate a given "reviewed-by" will not be taken. It should only be
> up to the user to make these decisions when tags should be dropped.

Should we go with "patch-id OR commit subject"?

-K

> > Yeah, and it's the part that I'd like to have as a standalone tool in b4.
> > Can we have some kind of "b4 update-trailers <MSGID>" subcommand?
> 
> +1

Yes, this is easy -- just a matter of sanely identifying how far back we start
looking to match commits to patches. I will probably go with "find all commits
by the current user for the past month and match subjects/patch-ids."

-K
