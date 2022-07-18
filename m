Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057C133CC
	for <tools@linux.kernel.org>; Mon, 18 Jul 2022 18:20:47 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id o21so9380468qkm.10
        for <tools@linux.kernel.org>; Mon, 18 Jul 2022 11:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=STWp22FgI/12c9MxSTXvwHl+PO6IgChjRE20+Sz3xS0=;
        b=VVBgsWSLjtPLuMcceYQeoLZu5MpoyEeJBCwnWgfNMYRZanyBTsaW+dLO18tvydiW9W
         s8hH8EAH0+YSw1FOP91yPtRGLLRsqEnlQdFT0jEhOu40oc4j+wlye2Bq06xzf8KLEvOt
         Xjb/Ln8+s/3OcOnLyAu68luG9YOBr5nVOU2GIwgA7Fr7JR3f3v7cQqBVnAnJ1LlwIDA+
         Uw1mgiy0x8+ALlh10+hTt2Ihsoc34Cxwt7hCy5gOjoT3qmHzns31TjTDZh7YCtprazmv
         mj/+kQIfT2AtG+Lfjbg40NNbFdFv39ZNhn9Oo5so/0Xwb0M0U9it9nAuBt+syYp9xEs/
         Poaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=STWp22FgI/12c9MxSTXvwHl+PO6IgChjRE20+Sz3xS0=;
        b=m24RblX9U+i3RlcfRlEBCIwRtdYq6amcElVrMjkOyH6bQptGm2EhkF1W+0Z2uYelLA
         N9sqFcF8g6pZlCXApfddaUVh3Fznbj0dO1tAhNLVputl7r48dDl39OOOYZF4FylK76A+
         6bdqcNfXzqRqUt3IziyVlL4gZTdHei9OoCEDIH6oAHk5CfffW9vuCxT1KPW34Oa6wuzY
         m8JwA08VyqyoUZcvKtDxkJzHM5yzNBM+lb9M0qTfwPW3JuwdiEQXXMmMLeeJFTIpbqLX
         Ri03cmEOo3wwk3k6GKBVgWcfeqVcbexqgAHlK20rsgrtorljuMXsD6GDqNXZoxtL5eUl
         WKYg==
X-Gm-Message-State: AJIora9s/4GPwwo+/d3cr/OQOXial+COXlUfWX1KN9HSOpU4qFiH8Rd6
	G3MdNOTA5HIlN4fuCipdQBXoEkIA770Kew==
X-Google-Smtp-Source: AGRyM1vvZTRWts7fF0WN7FUNnUbfFQdDDyDwan25cgDA9/9v2f5Es2bcH1D+Y0ZZYSR+CJ6bVlJ9pg==
X-Received: by 2002:a05:620a:f0e:b0:6b5:48f6:91da with SMTP id v14-20020a05620a0f0e00b006b548f691damr17739809qkl.446.1658168447021;
        Mon, 18 Jul 2022 11:20:47 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id az44-20020a05620a172c00b006af4a816963sm12859967qkb.133.2022.07.18.11.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 11:20:46 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1oDVMM-000JD3-1b; Mon, 18 Jul 2022 15:20:46 -0300
Date: Mon, 18 Jul 2022 15:20:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maxime Ripard <maxime@cerno.tech>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220718182046.GD5049@ziepe.ca>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220718084927.nlomzhq3ipni5alf@houat>
 <bd6f5628-1afe-efc9-9c2a-44685d730bfb@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd6f5628-1afe-efc9-9c2a-44685d730bfb@redhat.com>

On Mon, Jul 18, 2022 at 02:38:48PM +0200, Paolo Bonzini wrote:
> On 7/18/22 10:49, Maxime Ripard wrote:
> > > 
> > > One thing to keep in mind here is that actual trailer matching is done by
> > > comparing the patch-id (see git-patch-id for details). This has the following
> > > important bonuses and caveats:
> > > 
> > >    - You can rearrange patches or modify summaries without it affecting the
> > >      match.
> > >    - If you modify actual code (even as much as fixing a typo in a string), any
> > >      received trailers will no longer match. This is as designed, because if
> > >      you change the code, it's no longer reviewed (but we won't remove any
> > >      existing trailers that were already applied).

IMHO, I don't like this. It means even minor changes that don't
invalidate a given "reviewed-by" will not be taken. It should only be
up to the user to make these decisions when tags should be dropped.

> > >    - when you use --signoff, this will move your own "Signed-off-by" trailer
> > >      below any other trailers in all series commits, which is commonly
> > >      recommended for the chain-of-custody purposes.
> > Ok, that part is really awesome:)
> 
> Yeah, and it's the part that I'd like to have as a standalone tool in b4.
> Can we have some kind of "b4 update-trailers <MSGID>" subcommand?

+1

Updating trailers by hand is a PITA..

Jason
