Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643C91400C
	for <tools@linux.kernel.org>; Sat, 11 Oct 2025 05:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760162392; cv=none; b=nApy61paBigjZBExtNAyZ5FDNrtZgww7DosYE4bkVbSh8JshotV16OVfozskQvCFOvKow2BTNjtEdmKSEUIvlxWFvPt1kCZgIJ1yWLaczrbvdvnwuF5Ovf8ST5Y/qeo/oQkm0bCp0Ybe6M/PLYlj414zHehhe0d7AomeACjbTYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760162392; c=relaxed/simple;
	bh=B5vuCh+uOWXFUkakFm+j9OVOfrpFj7nDTlkWMY7P57g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Neq9jwqzX2+x1lDvq0P4UeBOcH/Iu/hWyrShcWXOo333d/TfXfZ63lKwf0IAw6Z78QqPhC7KB8y1TUuUYA4C8rDp8k3iNpwoQ3gM1Y6T6NUVr9Q10Qw9NwC0Qrhz2a/ATiouSBIK/y9H+AHjEkbX8PhVQgfaFQvlBHGTRczgifM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bwOczHra; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bwOczHra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760162388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=P4Ga8IG1HSzWRKNHDXvTqH5wv1H1RjylfFGwIYbwBR4=;
	b=bwOczHraX92SvuSFMEpvvjPorBjgaA1I2s3LP2pkBJTBk2xfQF7cxqgK93/DbGxxef3VTo
	ExUMVnlS0ZDjeBfvc7YB48kSs8SkNttMCVAu5l59unu1P1ctbL5DLGlPJbAhggkCUCnYz0
	Qu/6WC33AdEWd8YrP8cqeNrLgQ7Gb18=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-3y1b0dUaMxW0pUBBDBmWaw-1; Sat, 11 Oct 2025 01:59:47 -0400
X-MC-Unique: 3y1b0dUaMxW0pUBBDBmWaw-1
X-Mimecast-MFC-AGG-ID: 3y1b0dUaMxW0pUBBDBmWaw_1760162386
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ecdd80ea44so2222398f8f.1
        for <tools@linux.kernel.org>; Fri, 10 Oct 2025 22:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760162385; x=1760767185;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P4Ga8IG1HSzWRKNHDXvTqH5wv1H1RjylfFGwIYbwBR4=;
        b=kv0MlfJM6+1Y3bGks6aFO9YXCg0VzadRnZELml5Pd7b0DouYzT+/pjlgmHBk9ZilN8
         jDH0AwqvTDy/C+Hfz4QLH+pzA2I9TXdHbPYDoLuIYzZJ19kjxFdqXoZIn+E5ISazfa7K
         ai3hOIJs/lGU/B5ev3+pWCUFSR7rykcKZBl6epFA+qJAxmRu+R563/xycWFxEb1giRti
         hp7ziqqBcAq/pV3SweV/DFOml+Wa34nIta4EYpYAEhbXcldYaAFtyOi3nHaJTsC/K0/q
         t+BzIQ4d45ySq8AEroj8z3XDtbApHaEOVkuM9lxH9wLY9UOAsrux4QvzkpdSyG0SZWUD
         trmg==
X-Forwarded-Encrypted: i=1; AJvYcCWYRf3BMuRytBEM6KkVjyFOHPDz/HtnogUajcHLWXJlfEa3AHTx9zykyS1+fC1KVSQqRbyS5w==@linux.kernel.org
X-Gm-Message-State: AOJu0YzGm8kRKn2oSgNmlebve+ZZx41P29LEX0jIS6HMwGL3iA8YGzwg
	zjDgq7rQiGlhYg7IUXWqZvIl+MAzP9Q2dLc2JOOUlglrDgngUcRsYWC2pAL96ClWwRTJnKSEww+
	x7CZbk5JR/+wXYWc3pvwU6BMgMB4S/7PIBEQEEGHGw3GHRnt7UnSSzKQR3B75ANOSkgs427uFWZ
	xJa01SsePjHXbmfgGDoKdAEdRlniBAsmHte9nu5Hu4
X-Gm-Gg: ASbGncsHgvMZHPep1h9JSulOj+vH/nb0iflK8V733bpL8G3Ci9mAFawlfr2CZdGRGyQ
	FJ6RcGz6c79XLx2VdIy77WEalQ6TaohYe+3zk1SkII25435E7k/nE94kKUFTIDgDAc7w8DgYJ1M
	KZwe5StM5HheFaUmk4UdTtt5FejTAiTtHhO3cfjrzZd0zUNtdZ6t3pPAGPKUChf711KHNM7b1Ys
	HhjNdIpUaH84dK83j/psOiiyQ==
X-Received: by 2002:a05:6000:2dc7:b0:3fa:ebaf:4c53 with SMTP id ffacd0b85a97d-42582a055f0mr12401670f8f.29.1760162385139;
        Fri, 10 Oct 2025 22:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrc+kFMqWxENRXCEhbt5N/f8tgV2dPXhVAqp84p7nxCdd5JwxeJYlHfTT2UH4DIxbngZpjWBgCrgEx5VBUDfI=
X-Received: by 2002:a05:6000:2dc7:b0:3fa:ebaf:4c53 with SMTP id
 ffacd0b85a97d-42582a055f0mr12401664f8f.29.1760162384641; Fri, 10 Oct 2025
 22:59:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 11 Oct 2025 07:59:32 +0200
X-Gm-Features: AS18NWBkWfHDp2TFHK_VWJjw8vgNjn4DLOPveYZxz1YJcutOqFDKjmjhd8hVz5g
Message-ID: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
Subject: In defense of Link (was Re: [b4] initial "b4 dig" to supplant Link: trailers)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@linux.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _7UAkpNi7bLT90IcIsejVW1rTXx85ZUzXf-MnXNcunM_1760162386
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Il ven 10 ott 2025, 22:55 Konstantin Ryabitsev
<konstantin@linuxfoundation.org> ha scritto:
>
> Hi, all:
>
> I just committed the initial implementation of "b4 dig" that will hopefully
> make it easier for maintainers to figure out where a commit came from now that
> we're actively trying to phase out Link: trailers


Please let's not. I refrained from making statements during the merge
window and hijacking my pull requests, but I have something to say
about this topic and a soapbox to stand on. I'm keeping "users" as the
recipient for lack of a better place, but if people are interested in
the topic and prefer to have it in a more public place please let me
know.

tl;dr: Trailers are metadata, not data, and the link to the posting on
the mailing list is useful metadata. It was added to "git am" (by
yours truly) for a reason[1]. In fact it's fundamental for the work
that many people do on the kernel.

Let's look at various personas, how they use links and how/if they
could be replaced.

1) the intermediate maintainer. That's me. I get PRs from sub
maintainers and send them to Linus. When I receive a pull request I
review them and look especially for userspace API issues. If I find a
problem I will ask for a respin, and I will also reply in the original
thread because I am effectively doing a belated review and there will
be a v(n+1) of the patches. While something like "b4 dig" might work,
it's an approximation of perfectly good data that was available to
whoever applied the patch.

2) the stable tree contributor. After being asked to bisect for which
commit fixed an issue, a young and enterprising reporter finds that
the fix cherry picks nicely. As a subsystem maintainer you're happy
that the user saved some work for you, only to spot -7- in the message
id. Oops, better check the boundaries of the series. Giving a merge
commit to each series would also help here, but Message-Id is almost
always correct and so easily available that it almost becomes second
nature. When it's not there, you *know* that you have to check in a
different way; the solution is to add more Message-Id links not to
remove them.

3) the stable tree maintainer. Ideally, the same process I have just
mentioned for a person would be applied by whatever magic logic the
stable tree maintainers used. I know for a fact that as of a few
months ago they didn't, and this has wasted time for both stable tree
maintainers and subsystem maintainers (me) when they cherry picked
patches 50-55 of a series and it unsurprisingly didn't work. Given the
various reasons why one could use a merge commit, they are not easily
consumed by scripts and not as good a replacement as the known format
used by git-send-email. Which, again, is just *there*.

4) anyone investigating commit relationships and dependencies. It
could be anyone researching "git log" to fix a bug, or a downstream
patch juggler[2]. Again, links help understanding the boundaries of
the series. A decent replacement here is  "git describe --contains",
but message ids have the advantages of just being there in the git
log, if they are trailers. I will usually start with message IDs and
later do a second pass finding the "git describe --contains" of all
the commits I am cherry picking.


On top of this, adding a random Link as a trailer does not tell you
*why* the link was added. It's much clearer to "connect" a sentence in
the commit message to the link using e.g. [1] or [2], than to have a
"Link" trailer amid unrelated metadata.

Linus complained about Message-Id too in the past, but if Linus does
not like Link or Message-Id then fine, but can we please take into
account that he is quite obviously unique among kernel developers? ;)

If there has to be another solution then fine, but the solution is not
throwing compute power at the problem, it's *not losing data in the
first place*. Let's figure out what the solution is, document it, and
have all maintainers switch to it. And until then, keep the existing
convention in place.

Thanks,

Paolo

[1] "git am" adding Message-Id predates Link as far as I know. It's
less handy than a clickable link, but again the known format used by
git send-email comes to help. I have configured my terminal so that
"email addresses" starting with "20" open in lore rather than as
mailto URLs. :))

[2] say what you want about companies not using stable trees, but they
exist and several are among the top 5-10 contributors to Linux. A
simple process to move commits between upstream and downstream
benefits everyone, and anyway as I said earlier it's not like stable
kernels don't benefit.

> For now, it only does
> "b4 dig -c [commitish]", e.g. taking some random commits from today:
>
> Matching the exact patch-id:
>
>         $ b4 dig -c ce740955b238761ec1d8cf0590d7e6802d3a813a
>         Digging into commit ce740955b238761ec1d8cf0590d7e6802d3a813a
>         Attempting to match by exact patch-id...
>         Trying to find matching series by patch-id 469ebf2cf560b32106f206e389752deb5f741b6d
>         Grabbing search results from lore.kernel.org
>         Found matching series by patch-id
>         ---
>         This patch is present in the following series:
>         ---
>           v3: [PATCH v3] dt-bindings: bus: renesas-bsc: allow additional properties
>                   https://lore.kernel.org/r/20251009183630.5451-2-wsa+renesas@sang-engineering.com
>
> No match looking up by exact patch-id (and trying myers, then histogram, then
> patience algorithms with no success):
>
>         $ b4 dig -c a29ad21b988652dc60aa99c6d3b1e3d52dc69c30
>         Digging into commit a29ad21b988652dc60aa99c6d3b1e3d52dc69c30
>         Attempting to match by exact patch-id...
>         Trying to find matching series by patch-id abc964d5d53674450f7e553bbe031edc61ac3308
>         Grabbing search results from lore.kernel.org
>         Nothing matching that query.
>         Trying to find matching series by patch-id adf0918395a1a601a8d54d7d26446aadfb6101c2
>         Grabbing search results from lore.kernel.org
>         Nothing matching that query.
>         Attempting to match by author and subject...
>         Grabbing search results from lore.kernel.org
>         Found 22 matching messages
>         ---
>         This patch is present in the following series:
>         ---
>           v3: [PATCH v3] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
>                   https://lore.kernel.org/r/20250829175152.9704-2-daleksan@redhat.com
>           v4: [PATCH v4] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
>                   https://lore.kernel.org/r/20250902142429.14041-2-daleksan@redhat.com
>           v5: [PATCH v5] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
>                   https://lore.kernel.org/r/20250915210829.6661-1-daleksan@redhat.com
>
> There are known annoyances:
>
> 1. We don't currently weed out AUTOSEL/stable backports, so older commits may
>    end up in lots of false positives for now. I've not yet figured out how to
>    avoid this without hardcoding it to be kernel-specific.
> 2. Patches that were sent as part of one series and then as part of another
>    series (by the same author) don't currently do the right thing.
>
> I'll work on getting that fixed, but for now if you're missing the presence of
> Link: trailers, please test it out.
>
> -K
>

