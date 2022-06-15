Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163CA7A
	for <tools@linux.kernel.org>; Wed, 15 Jun 2022 18:44:18 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id l192so7255577qke.13
        for <tools@linux.kernel.org>; Wed, 15 Jun 2022 11:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UMYm4Okz8pcCLzNkKoGHC3aAbQSrn4/v18HGXzPSixI=;
        b=gUhPd4AsDfRxJ7puaoceDTcDA7604Hsvl8D+ZOIMnR6USxSTXDWi+2gUbDuYwjW3gx
         Dk79RzPZG7gzWo1oNAhwPLoN/k449Q5WFRjt50iUg2q7qqbHnu2XFSQy6nJNI7gsxAMg
         zKVCfisSVnBC/BRvYoIseXzUACBcAjeW0gSD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UMYm4Okz8pcCLzNkKoGHC3aAbQSrn4/v18HGXzPSixI=;
        b=IoZhlzXZp8YMCLV0etc7Qamg5Tjl+8hhcsVveGRpEbpSKsvFqoqcpN0Uon/FvHKK0S
         FBrnsgWgh9BK+o0JfQrlwZN2LXKEvWfWM36Rehty2vs9vXJ+YobWytIaLSIyCPT+PCSy
         kvg8GWwyuWFS8zgawcE5mVF4ae3+mQkCY+548bFJqijdIuv55emr6QzIxF5cKpt4iAR+
         5e4Cj/lININPlfhBh2F3y4B67Bwn4wwUxDU+rLHny0ReVElrIUJYzB2qPO0qO0YbmZys
         2yuh0QjuI+GyEu2SsUQlftri2uc+/GMtdYmfOsjyQlZhaLUNGdGqcPQACgM0jaKe95mC
         rLmQ==
X-Gm-Message-State: AJIora/GVkmq15iHDFH4I6ePEe6mRUAfJSq+d7iZKIorx6GDgqa6TG40
	CcGlKmGiILctU6igQpa1yIb2SA==
X-Google-Smtp-Source: AGRyM1tpdAauJspyMVXwyyYkDs7eiWzcl8d1VP9maZVE07FJJ5Oi2bfzWvgqPm0UK6pUekNw5Np8kA==
X-Received: by 2002:a05:620a:400c:b0:6a6:f8e6:92cc with SMTP id h12-20020a05620a400c00b006a6f8e692ccmr905348qko.561.1655318657845;
        Wed, 15 Jun 2022 11:44:17 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id n7-20020a37a407000000b006a66f3d3708sm11751646qke.129.2022.06.15.11.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 11:44:17 -0700 (PDT)
Date: Wed, 15 Jun 2022 14:44:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 Link: trailer disambiguation poll
Message-ID: <20220615184415.7nanay7fmvajxv5n@meerkat.local>
References: <20220614213955.eyex4bekp44iroud@meerkat.local>
 <CAHk-=wgzRUT1fBpuz3xcN+YdsX0SxqOzHWRtj0ReHpUBb5TKbA@mail.gmail.com>
 <20220615181705.5e5o7h7p6sk3vlpv@meerkat.local>
 <CAHk-=wiziwMm+tryjjiX6nyNddMKYu_z3K3AasQ75rT5u1MR=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wiziwMm+tryjjiX6nyNddMKYu_z3K3AasQ75rT5u1MR=Q@mail.gmail.com>

On Wed, Jun 15, 2022 at 11:22:59AM -0700, Linus Torvalds wrote:
> Why can't we just have a nice sane patch-ID gateway, and get rid of
> this silly thing?
> 
> That would be *SUPERIOR*.

This is already an accepted upstream feature:
https://public-inbox.org/meta/20220512193859.M526956@dcvr/

It's not in the code yet and will require a full reindex, so I don't yet have
an ETA when searching by git-patch-id will become available.

> It would give you the different versions of the same patch that got
> posted multiple times and maybe got discussion.
> 
> The whole argument that the "original submission" is special is pure
> and utter garbage. It's not special, and trying to make it so only
> takes real information away.
> 
> Really. You are making things worse, not better.
> 
> b4 already depends on lore automation, so why not improve that
> automation so that you can look up things by commit ID, which looks up
> patch ID, which is indexed by lore when it sees patches?

Well, b4 doesn't actually depend on lore that much -- it can work with a local
maildir just as well. I am trying hard not to add too many features that would
make kernel development fully dependent on lore being up and running.

> Then you will automatically also see things like "oh, look, this same
> patch was then submitted to stable after it was committed". Things
> that you literally *CANNOT* do in the commit itself as a link, because
> it would require time travel.
> 
> And no, the whole "but people edit patches and the patch ID might
> change" isn't an argument either. At that point it's no longer a "b4"
> thing to add a link.

My problem is that maintainers still want automation to properly recognize
that it's the same patch and its status on patchwork should be moved to
"Accepted".

Maybe the better answer is to integrate patchwork API into b4, so that I have
to do less guessing on the git-patchwork-bot side of things.

-K
