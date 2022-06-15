Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93054291A
	for <tools@linux.kernel.org>; Wed, 15 Jun 2022 18:17:08 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id p31so8294604qvp.5
        for <tools@linux.kernel.org>; Wed, 15 Jun 2022 11:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=geCtp2OxL9hZKewpO7IaX6vO4zOvh4AkeujlhLyVJvQ=;
        b=ShmleGRbGjmWPvy+sYo1Y61Y1+SfP0sZ37H9Fu6Xs88D/Thdzsk/qNlrq9Y5nQQEio
         vfVRXLKlG6OMmNvwoeuVDh7dhARAbPqBQMHB5pAV4x9eirifxkfn1WzbA5Oo6NqbgedP
         kIaHIFFydNBotv8PlrTr8oImUesMRzmQOWft0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=geCtp2OxL9hZKewpO7IaX6vO4zOvh4AkeujlhLyVJvQ=;
        b=v/DrKF9zercz303WL3w5OMaDRMcWwwb1YxzGIv+XcWBDEcVMJgyxnCDb5vUeE7oIvo
         VBrALcqmVmBsZLOeCM6zltbw4NKiGDORnr75a7IKh+5HhFgJ/q1Fjpy4VYu+6h89uoVu
         Hi5v9Y5RMJP480tlYRb4elaP2s+G/3fqx+6cIHADw+UHJeHRGrknqplBgX1hKH3zRUW6
         3MvXJj3B7+YopdtvR2FxCeaOocIIW2v+y8DIJOuIBBXHoD9GOrZS9+VZZ362FIaFOQB2
         gqVGW2xULezoVbky8xJhbbK6AhYLEdHnb9fweW1jAtyGtUy9X2zqoImnLLjbxAM9Di17
         NrDA==
X-Gm-Message-State: AJIora/xxx/REbqHUIVqNZ69L6QytjlMpmg2q/SrkBrA7D3K3+SHzGDx
	ONRv7jNiJORy2DdQM+QrxiNjjA==
X-Google-Smtp-Source: AGRyM1vsijxL5JgrK2UgtkmO8/ZWIv0JXzX0lsqXXM44/STf6V40BCUCCZTc1U7PbQqRBtM63mZ/sQ==
X-Received: by 2002:a0c:f886:0:b0:46a:a0f8:db40 with SMTP id u6-20020a0cf886000000b0046aa0f8db40mr859695qvn.88.1655317027401;
        Wed, 15 Jun 2022 11:17:07 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id t5-20020a05620a450500b006a79f9d6521sm7534981qkp.74.2022.06.15.11.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 11:17:07 -0700 (PDT)
Date: Wed, 15 Jun 2022 14:17:05 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 Link: trailer disambiguation poll
Message-ID: <20220615181705.5e5o7h7p6sk3vlpv@meerkat.local>
References: <20220614213955.eyex4bekp44iroud@meerkat.local>
 <CAHk-=wgzRUT1fBpuz3xcN+YdsX0SxqOzHWRtj0ReHpUBb5TKbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgzRUT1fBpuz3xcN+YdsX0SxqOzHWRtj0ReHpUBb5TKbA@mail.gmail.com>

On Wed, Jun 15, 2022 at 10:41:19AM -0700, Linus Torvalds wrote:
> So if we want a new tag for things, just make that new tag.
> 
>    Patch:
> 
> would at least make SENSE for a link to a patch submission. Although
> it's honestly just a big sign that "this link is not worthwhile".

Well, it's not intended to be worthwhile to maintainers -- maybe just to
lawyers, researchers, and automation tooling. :)

> Yes: if people want to make patch submission give more information,
> then I think b4 should encourage taking the *COVER*LETTER* and make it
> into a merge commit, and at that point it's probably worth having the
> link to the patch series in that merge commit.

We're mostly there already with "b4 shazam" (in the upcoming 0.9). It
makes it possible to work with patch series as if they were pull requests,
complete with a prepared merge commit message that uses the cover letter for
most of the content.

That said, I think we can still really use direct patch links in commits,
because leaving that just in the merge message does significantly complicate
automated provenance matching, especially in cases when the maintainer applies
partial series.

Apropos, we can also disambiguate Link: trailers by using a separate domain
for pure archival links, e.g.:

    Link: https://msgid.link/20220614213955.eyex4bekp44iroud@meerkat.local

This way if you see lore.kernel.org, you know it's probably a discussion link,
but if it's msgid.link, then it's just a link to the patch series.

(that domain already works, btw -- it's a simple redirect to lore.kernel.org)

-K
