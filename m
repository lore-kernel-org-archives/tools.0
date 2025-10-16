Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602571607AC
	for <tools@linux.kernel.org>; Thu, 16 Oct 2025 15:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760628826; cv=none; b=hp2A4N76AX6R8aDtHfhOEnRUyTAcW+cY0PZXcqPGmuqqVSU4W8Lsm7681ePUMp6XDSs7PEpJ8MLrlGiGiS6OjRm2nvShWf6vVrDkTC+7nTPwS1Q8OFjk3INv0IMrb3Qz7bPpUkO8fWzw835g2N1952XSwfiXetfYsuLwR7XsK34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760628826; c=relaxed/simple;
	bh=2IK9h7/XBkQT1gRnibTaV8TCE1o9/urZ7Ct8nlP+JPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGMxXmm5/DXAfyjf46vaMICyftPLhQjVcFdTtRE0Ieg8rxqg94/YNqiwzWGbVB8SpDmzi3cDA4vvjNyxy3X/qAmCzRdSA7Sa3LjjgvjSPBEtVCBfkrnVZfNQnExHbRkdh0XYVHbTNsBuVwv1gghEkaoN7OhB5ha3FP0i0th1Aog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5d3fb34ba53so696029137.1
        for <tools@linux.kernel.org>; Thu, 16 Oct 2025 08:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760628823; x=1761233623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zG/kqjr5lxRVsECbXH3JqA0F7qcA9Sq6ZUy+FCvZtds=;
        b=HMGHGfWMNyOIILf9u0rJZmwE3qNUFP+HvkSetFD6Im+gTmww3EcfNvZZG8ppWbMHyv
         2diKm8W5goEN23jpqITHjYFFhpHMWzXYF1aq3xtZBPgXks+5QIFCvIHWbvHXwBgFIA1K
         6YdW/eMNnnB1MgAZUM6+oN5a8d0mbHAxi260iYhoQjKZvwn5tgc5rGgsR+syrUHVGMs+
         JjQw751AK93z3c11WGFeElgEcFbUoNo/RIOMz3Vc0HporMyCXzFUb2nZ61IanNcdI8nO
         NYRkm91bICOEDO684r3KuuW+pTG4GZgbxdYkEGfJloySRorvJZuQmp7ByAx0H+rXi53Q
         ogSw==
X-Forwarded-Encrypted: i=1; AJvYcCUoojhxGRnsmSHa4TQEQmlenQgUlXz7shyZ4jDJEUNHQuWS48hAmg0DZN2npK8CtmugJMe0aQ==@linux.kernel.org
X-Gm-Message-State: AOJu0YzA8m00HZ2WjfmEiSeZmveYsVJqRNng3NI5rq3FgHjojW0mE/NW
	MzcKsbZBkAzKQ+gd0lOpvUCcdSxTynEljkUG1OO+hhlmSPCQJTJ4sKgcBPPncluK
X-Gm-Gg: ASbGncu9tzWLQk6tXHC6ygCb9FfOKjIqi47eWCGSYABQ89A2teGkbUELv6LX5V1yZLu
	/XozHB1UrzPvrMhUGxkBSA+7bQ61J3tqCNY1DqEBrMVY69Q+fod9t9M5QA7ZwCjDaFCMBavb3RA
	rr55ELTK0K3JjmSw1bdxsXRQTkgcWHxJ3Y5d+QTyxN6C1HhbPh89+VHyD1wO57k0VNOCcmRa6ni
	JZtFXLBTL4RkQd3I3gSTY38ChGQazsnqTKvT1eCIotmZZPUSMaVFvxzk6MGvSvLxVf2AbrGOIe3
	4ePqsaeGsVhdFxqHiTnIGbHZzp8HafmY1M5bqFnc8P62dNRvz7/HPnKvOx9emtRiGEBzkBAomT6
	MlZ7/By/h8gCY1Ey7nHVHKf2gX5MrfPVa0ZRJJsEbl0ZPhYLKmPNCfaK/9bJD5svbc8eydPJqvH
	ZvF/0iX568YxXUM5b0WBBAZdZi5Ka0i/uKjwIx1g==
X-Google-Smtp-Source: AGHT+IGiUK8eY9AbKJtih4RVfYwQkBjqDPPdd7MajJHXtNCE6df+lW6ciVWof2XBRe+15CW075f1Lg==
X-Received: by 2002:a05:6102:3051:b0:522:db47:90ac with SMTP id ada2fe7eead31-5d7dd55566cmr353732137.6.1760628822987;
        Thu, 16 Oct 2025 08:33:42 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d80ddf8asm6104588e0c.21.2025.10.16.08.33.41
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 08:33:42 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8e2e9192a0aso582521241.3
        for <tools@linux.kernel.org>; Thu, 16 Oct 2025 08:33:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsB5WBWyYuIAkteBR/g4PFbhAVGfjJfP/JeLoroi/mmWV5Y85CA6PJ1yMAx48bsFhhQYp/Yg==@linux.kernel.org
X-Received: by 2002:a05:6102:32d6:b0:59f:4f48:4e31 with SMTP id
 ada2fe7eead31-5d7dd55a017mr407545137.1.1760628821385; Thu, 16 Oct 2025
 08:33:41 -0700 (PDT)
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
 <20251014033900.GA3126@1wt.eu> <CAMuHMdW8R0Smx_CKGL3b0tLiyEB63z5uxvXG2ZG5_sRy13+UQQ@mail.gmail.com>
 <20251016150808.GL3938986@ziepe.ca>
In-Reply-To: <20251016150808.GL3938986@ziepe.ca>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 17:33:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnt05w+_a=7fMZBfUyT-eGBxA3Li5c4ox2C513f403-w@mail.gmail.com>
X-Gm-Features: AS18NWCTsiDNx3dwQdbJV92gl0q34hBy5TV9cDWr6Kuhniepmd8lCoYOfB4H7rY
Message-ID: <CAMuHMdVnt05w+_a=7fMZBfUyT-eGBxA3Li5c4ox2C513f403-w@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Willy Tarreau <w@1wt.eu>, Linus Torvalds <torvalds@linuxfoundation.org>, 
	Junio C Hamano <junio@pobox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

On Thu, 16 Oct 2025 at 17:08, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Thu, Oct 16, 2025 at 04:52:31PM +0200, Geert Uytterhoeven wrote:
> > As the audience may not know: you can keep empty commits while rebasing
> > using --keep-empty.  But it is indeed tedious.  So I wrote a script
> > called git-add-separator, which creates an empty file .separators/L<N>
> > (N increasing automatically) and commits it, thus creating a non-empty
> > commit that doesn't interfere much with the rest of my tree.
>
> I use empty separator commits all the time, and git rebase -i
> alot. Never had a problem, never needed --keep-empty..
>
> Don't see any 'empty' related config in my 'git config -l'
>
> It seems like rebase doesn't remove commits that started out empty, it
> removes commits that become empty
>
> ?

You are right, empty commits are retained on interactive rebase with
my current git (2.43.0).  They used to be shown in the interactive
rebase with a hash mark in front, thus considered a comment, and
dropped.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
