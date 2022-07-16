Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F63D7A
	for <tools@linux.kernel.org>; Sat, 16 Jul 2022 14:56:42 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id r17so5776910qtx.6
        for <tools@linux.kernel.org>; Sat, 16 Jul 2022 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X2rD2sQG5+JYUYP6HbxqCEagfirKmST6HjChAbihXno=;
        b=IEe2wZLsSid6KpaLn+94hADUA3zjZgeSseUKI02cVdomZY8I8UYXC3lnsqE+BUoKZf
         A4zzKKr+/U86aoj/qezj6bJAxhmud3XEdT5s27K09sj5F2ow8kcp3R/cLofE8C2C3H52
         +mXQ7OjuAOLgM6O0i0M5u/UTB9iiHftinlK8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X2rD2sQG5+JYUYP6HbxqCEagfirKmST6HjChAbihXno=;
        b=mDg7mNUrlCu6KRS6FrbvoGVxQzlE7kbO91W/QL2C53km6gqnIB3gTfCHZB0UrdFU55
         kdb8ssJ8+sEDorEqqhjTqS0vQiQwRnggqjl6tiGI7W8lezwyX57XDQM+oIAJGtjG8MCh
         s1tdyxKTg1G2TPqjI1rXEmy9dapC3hjBzkMU8QApXMDaUowtJ8+v+txfbtRaH/vTo+qv
         shOKVr/jjRQdFl3g99vG3+swpqn0PRnMfHFMYRLHU0zub+Kh3jarKLP114FSZnAmpk0u
         3lsTqfo5lPu0EtpAUe0MKpHHvcZoaUQ1jE6yGHa8u+0ywiEwIMy4KyUdmbqMMXiVNE9r
         q3Mg==
X-Gm-Message-State: AJIora+jrD5OFSd4FAv3gDed0ffWdGRmeflwpSC3eJ1hJHAxSb4agfOG
	5ZSJg3WqV6yzu66D6XAVd6b43w==
X-Google-Smtp-Source: AGRyM1u/f/CNTHbZu09yZdCT94z8rKZyr+aHYgcqblS0t5HDmYW07W3RxgvJegprTNj9xxDc3vMcCQ==
X-Received: by 2002:a05:622a:1b8b:b0:31e:b43f:4fb9 with SMTP id bp11-20020a05622a1b8b00b0031eb43f4fb9mr15756189qtb.329.1657983401044;
        Sat, 16 Jul 2022 07:56:41 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id i12-20020a37c20c000000b006a6a6f148e6sm6398279qkm.17.2022.07.16.07.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 07:56:40 -0700 (PDT)
Date: Sat, 16 Jul 2022 10:56:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220716145638.ubuwwc7xtjw6ugy7@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c4652b0e333bd81b91f71346ac6142322682eff.camel@HansenPartnership.com>

On Sat, Jul 16, 2022 at 10:43:17AM -0400, James Bottomley wrote:
> On Sat, 2022-07-16 at 10:29 -0400, Konstantin Ryabitsev wrote:
> > After the branch is created, b4 will create an empty commit that will
> > serve to store the cover letter contents and some tracking
> > information. You can view the raw commit with "git log" just like any
> > other commit, and you can even edit it with "git rebase" but it's not
> > recommended. It's much better to use "b4 submit --edit-cover".
> 
> Could we please stop inventing stuff that's incompatible with a
> standard git workflow ... or argue with the git maintainers that what
> we want to do is better and persuade them to add it?  That way git and
> b4 are fully interoperable ... for those of us who aren't dedicated to
> one or the other.
> 
> The standard git way of storing cover letters isn't in an empty commit,
> it's in the branch description.  To be honest, this does seem a more
> logical way to do it (a commit can get lost within the branch), but I'd
> be reasonably OK with either mechanism, provided both git and b4 agree
> on it.

I hear you, but branch descriptions are confined to your local repository and
can't be pushed to a remote. So, if you work on a series, send it off, and
then pick it up again two weeks later from a different workstation, that's no
good for most of what b4 submit needs to do. :(

So, it was either using notes (which almost everyone forgets to push anyway),
or using an empty commit. I agree it's hurky, but it currently the only thing
that fits in the "least likely to end up lost on a rebase or workstation
switch" category.

-K
