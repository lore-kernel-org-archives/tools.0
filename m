Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029F5291A
	for <tools@linux.kernel.org>; Wed, 15 Jun 2022 18:23:18 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id me5so24928553ejb.2
        for <tools@linux.kernel.org>; Wed, 15 Jun 2022 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K6aWxeFHqXRgfPln71EbYZyRWrmN0NT+mkE5GF2L+4M=;
        b=e1bU5zP7a1iQYuY572xq0k1w3zJ8P1JMFlMymbgh93caTYNJRqT89OplCKEBQy9X04
         KVp7WJOcd0t6ktwR9bCb14XDgDe7EjFqXuLxxl1Zci9EnLYM2EJAttoZwIPpV18HSQlo
         0LQzLqNydIcrj0G2zrqkMGrQyzkTvLzdHRJ04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K6aWxeFHqXRgfPln71EbYZyRWrmN0NT+mkE5GF2L+4M=;
        b=xTk2hnhLB203mOs10+Ipvl9dOeRpMRrHcO9NyhFE81CS5fn7ClP0hIicG1k/L68SGq
         h+QK/cL+gzbFj8Yze0z0vUXQJ/5qUcdaZzYXuWLyYxr00oObkJQFkgmMcKhu7QXDxeTq
         fUuaxqvpohltM+FsP8j8yGaFRyceOcN5yLUIGlqm81j2glzNJyZc4u4o9y6CLCz0d+PD
         vy38HdAc7Y1OTmol3tsKSjmu4CQKpQZbROeeeRVSdbcX54F76PKo8xWVJtp1TruJVUBc
         5/AHksFdK9RJtbhKUte+H+ynM2LjVe92izLbM9UalCPPH4atRX1lOdXXvwErQTSnYLcE
         bC/A==
X-Gm-Message-State: AJIora/oOwvAlx2DGw2DUNIUEqi2s72ShiLex4c9GzIKSWIpU0Zj6S00
	62pJWHZgqIZsbLC4oWnXxKG5hXxOV/2/LiwVs+o=
X-Google-Smtp-Source: AGRyM1tmYcaSe48p7cqcltCydEa+2RgUE2TplnNoen6ZlK3GXYBIBDgR8JE0Jz7ruvpJKI270GqwpA==
X-Received: by 2002:a17:907:7f8f:b0:711:623e:b344 with SMTP id qk15-20020a1709077f8f00b00711623eb344mr1072198ejc.230.1655317396920;
        Wed, 15 Jun 2022 11:23:16 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id q4-20020a50aa84000000b0042617ba638esm9937285edc.24.2022.06.15.11.23.16
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 11:23:16 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id x17so16462037wrg.6
        for <tools@linux.kernel.org>; Wed, 15 Jun 2022 11:23:16 -0700 (PDT)
X-Received: by 2002:a05:6000:1b0f:b0:210:313a:ef2a with SMTP id
 f15-20020a0560001b0f00b00210313aef2amr1010669wrz.281.1655317395866; Wed, 15
 Jun 2022 11:23:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220614213955.eyex4bekp44iroud@meerkat.local>
 <CAHk-=wgzRUT1fBpuz3xcN+YdsX0SxqOzHWRtj0ReHpUBb5TKbA@mail.gmail.com> <20220615181705.5e5o7h7p6sk3vlpv@meerkat.local>
In-Reply-To: <20220615181705.5e5o7h7p6sk3vlpv@meerkat.local>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 15 Jun 2022 11:22:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiziwMm+tryjjiX6nyNddMKYu_z3K3AasQ75rT5u1MR=Q@mail.gmail.com>
Message-ID: <CAHk-=wiziwMm+tryjjiX6nyNddMKYu_z3K3AasQ75rT5u1MR=Q@mail.gmail.com>
Subject: Re: b4 Link: trailer disambiguation poll
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 15, 2022 at 11:17 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Well, it's not intended to be worthwhile to maintainers -- maybe just to
> lawyers, researchers, and automation tooling. :)

Honestly, I really despise that argument.

If you are a researcher or whatever else, you need to do this by patch
ID *ANYWAY*.

Please.

Why can't we just have a nice sane patch-ID gateway, and get rid of
this silly thing?

That would be *SUPERIOR*.

It would give you the different versions of the same patch that got
posted multiple times and maybe got discussion.

The whole argument that the "original submission" is special is pure
and utter garbage. It's not special, and trying to make it so only
takes real information away.

Really. You are making things worse, not better.

b4 already depends on lore automation, so why not improve that
automation so that you can look up things by commit ID, which looks up
patch ID, which is indexed by lore when it sees patches?

Then you will automatically also see things like "oh, look, this same
patch was then submitted to stable after it was committed". Things
that you literally *CANNOT* do in the commit itself as a link, because
it would require time travel.

And no, the whole "but people edit patches and the patch ID might
change" isn't an argument either. At that point it's no longer a "b4"
thing to add a link.

               Linus
