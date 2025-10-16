Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E6C3431FE
	for <tools@linux.kernel.org>; Thu, 16 Oct 2025 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626368; cv=none; b=pIEftoCdU/cRnA1h7VllgsVIAcBH6LBJPL0o/oAw4aB7TUohztKQJUJimNM/Bmaxk8Pq5tHWmijwAxSkWVAhkhwqh4bGuj1gEsdTOpsipm5l3I+s5115iL59VOtD3G4co8M52d/mkniFeRVZuo7s/+QxE3I0QUdC/pqdnRAtwV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626368; c=relaxed/simple;
	bh=6ccb/gRGb/KJgnVLssaQxscpot3LOvQRPI74sLTo474=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GoklFTpA6Z/vY9y9S0RDouheg4Zz1b5u/YT0dvWUqBHyBT3vIAK5Hh3EpdyK/Z3A4zLXNLZj80ATIdNtdwREcyvH0MmSAgPhVnjx43I6eWSfROpRkkwy7RA28NPbcEzqOD3OIrJ1NQvb9H6UOP6LB0MvaSppIsXiO2IDkQiMtq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5a3511312d6so379941137.3
        for <tools@linux.kernel.org>; Thu, 16 Oct 2025 07:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626365; x=1761231165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3dpVRYtpBdAD5EkvZzf/MRnzttl1OFDj2601ym5h5Y=;
        b=o4Ihv6dW6UyHt9+vg7c2M186WLs6rXFhumsVrIcmapPPjOJftTJnWJrDWTCPNxA0Lg
         KQLT2K6uzTdAOMxj2F1SrhyolaJeNZl4YplJslw+WFDyAROpop3gj/2dWCKGSrRfU9a4
         StMTux+Iojc4yLxemmh/mhHxJ6D65DxGgAFb3Ia5zOQW4/U0pSLwwm5Yb7YwH27w7odP
         OE8CTWeG1mzESKzPUr/2sMsz6zLISGCtqscrxezAD2wN/mIkbM/+dFV80Z/CxpEgUrDq
         Zjny6L2ugr3ANh9CwLoH9oZfy5QMAZbjjb1e2Nw836ZuTlUUX7iiNVhqsXzYzvFwar5S
         JMeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9GJEJag4eH7k13ajHSumPmEQcvls66AaVJ4FIpZ/HO/04BRcLtZe4NRg427xF7NtIZGrEOw==@linux.kernel.org
X-Gm-Message-State: AOJu0YzpOUq+sYFOmQBnMIPr9BDwcLzJ5DixEcS1TQNKHCWM2Y37mBMD
	wER1z7BHcY76URpISozlCHKyBP7tRc1qVMtxH8wjyazoERe2mPu7xLUaM3pYYgYf
X-Gm-Gg: ASbGncvSlaZQhp8sXxIkPB8LLwX0gV9pAWHO9EpIZsG3s2Vuso/sU7/9kBqCMz3r/HA
	smw7rk3tCGeBY9JaHDlo+gmtyHg1YtB03CRm+xSkc594RC3wGXHc7jAxIKxtP+iv+hENM+Aeg4r
	Br3sMRRjwxs0w7hdVf7vAfP8C/22FUskOFEFb3rrLaD5204tbNz7ZtdVbkh6E80N9s0erPhak0H
	VtVi+03rPfQwH6pozAU9IgVd8OxgPFBA4ut2athsKAIKFjQGoRDxJt6le4oJNMSnKLSkL48W2HU
	Zb79X8pcOTyexLAahP5bqqunGFXWuVdIqZbuyHAGge+skcGxA62GpKQC/PbpZAZ2jkCNZwPY306
	6pbOqyyGpYzX8CfJERBZz/2Y8SHjlYpMT3QVt2BFZXczvWA8rOO8tBDDyB0yTiDXC16B2qQDpt0
	5HcCU7fj0qsHQ+cUOQbowGMp+NbhNa50MMNFioLQ==
X-Google-Smtp-Source: AGHT+IHlx6mw490E7XkAOJ8OE//c5no1Nyuv35Tm0YK+Xq+SRlEqIDomMMqUjE3DmuFHbo0HWqScDQ==
X-Received: by 2002:a05:6102:26cc:b0:5d6:36b8:769f with SMTP id ada2fe7eead31-5d7dd554d82mr229048137.8.1760626364572;
        Thu, 16 Oct 2025 07:52:44 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf56def7sm5525428241.0.2025.10.16.07.52.44
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 07:52:44 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9310a7b2668so133846241.3
        for <tools@linux.kernel.org>; Thu, 16 Oct 2025 07:52:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYO/9tr2cuulZ6oFK/wWIV46wOSaNiX2YE9ILfksiUM7+J9Tfrexwbf/7qhI0V968IOpNWJw==@linux.kernel.org
X-Received: by 2002:a05:6102:611b:20b0:5d7:de89:b7e3 with SMTP id
 ada2fe7eead31-5d7de89bc79mr113070137.9.1760626363798; Thu, 16 Oct 2025
 07:52:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CABgObfZS--70UTOpSXo=JOZViN1jm4O6M92pu-6Qunif3v1Y8A@mail.gmail.com>
 <CAHk-=wg4WfbXs-kMOAM7FmQ0w8q3KO9DC8CWLg1WPnoaZW-Wiw@mail.gmail.com>
 <xmqqy0pezhm7.fsf@gitster.g> <CAHk-=wh--VXgwQ3s8DLeag6cegsD9cPcvkmbVft0Gesy2aGPsA@mail.gmail.com>
 <20251014033900.GA3126@1wt.eu>
In-Reply-To: <20251014033900.GA3126@1wt.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 16:52:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8R0Smx_CKGL3b0tLiyEB63z5uxvXG2ZG5_sRy13+UQQ@mail.gmail.com>
X-Gm-Features: AS18NWBY-mm32ZI-dKjqMJEd2ZNiFX9kEGA4LbVU5EM4QAdnELBsmh-u7jm8b8Y
Message-ID: <CAMuHMdW8R0Smx_CKGL3b0tLiyEB63z5uxvXG2ZG5_sRy13+UQQ@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Willy Tarreau <w@1wt.eu>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Junio C Hamano <junio@pobox.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Willy,

On Thu, 16 Oct 2025 at 16:37, Willy Tarreau <w@1wt.eu> wrote:
> On Mon, Oct 13, 2025 at 02:44:28PM -0700, Linus Torvalds wrote:
> > So rather than doing a separate branch, rebasing things there, and
> > going back and rebasing away the things in my original branch, doing
> > just 'git rebase -i" in the original branch and having some way to say
> > "this is the start of this series", and a "this is the end of the
> > series", and having git rebase create a set of linear series with
> > merges that delineate them might be quite convenient.
>
> FWIW I'm using "git rebase -i" a lot, that's probably the command that
> really makes git magical from the developer's perspective. While I know
> it's possible to keep empty commits, it"s usually not welcome because
> the purpose of rebases is to be able to rework a series by moving things
> around and eliminate those that have been nicely integrated.

As the audience may not know: you can keep empty commits while rebasing
using --keep-empty.  But it is indeed tedious.  So I wrote a script
called git-add-separator, which creates an empty file .separators/L<N>
(N increasing automatically) and commits it, thus creating a non-empty
commit that doesn't interfere much with the rest of my tree.

> Thus I think that what would really be nice (and that I've been missing
> many times) is a type of commit that git recognizes as a delimiter, i.e.
> it doesn't contain data, but *something* (maybe a dummy diff on /dev/null
> vs itself?) allows git rebase and git am to say "OK that's not the regular
> empty commit, it's one I have to keep anyway". Then one specific option
> of git am or git rebase could be used to turn that commit into a merge
> one.

Can be done. Let's try manually:

    # Pointing to the "empty" commit with series description
    top=$(git show | head -1 | cut -d " ")
    # Find previous empty commit
    old=...
    git reset --hard $old
    git merge --no-ff $top~1 -m "$(git show $top | ...)"

OK ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
