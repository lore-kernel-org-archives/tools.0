Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3257A
	for <tools@linux.kernel.org>; Wed, 15 Jun 2022 17:41:39 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id gl15so24684267ejb.4
        for <tools@linux.kernel.org>; Wed, 15 Jun 2022 10:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iMU3pUJpDT3TGKIX2U4C+6IHogRhLbJm3AQGVF6iUpE=;
        b=a1PB519QrNykpMk0lBClX17RSSzHxVqvlD2gmPJfTj9dverPfmmGcXMmhwyWcDAr31
         yM9OtoQrCqtRZ+k8Ie0BBGw2ks2QuW6d0hIjP4mNJfX0WNgcDP6eqa6ZHZ2JoyN/8rlb
         VsRU7Q0Xq3SGoSkD8uXM/ujN6Go//5QM/xZAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iMU3pUJpDT3TGKIX2U4C+6IHogRhLbJm3AQGVF6iUpE=;
        b=nlWvqnvzNWMffv6yA+n0x94v7CS/RRl2le2MhbnW5qkPw58i6QUmJ19PNFydndmWmj
         EIJyH8o/k6/NsEbvg8sqcWUuk//XQVASplfAVqnjBDxqvluJM2t9ordyXkOMKmg+cMvy
         fN+5Ob2mp6YuomDwxdWojIWffcXeXsMsxm4T6yBMYezMQanudFI1+0KX1XU3s4mkCE0C
         t0JwzkAk87aqXCL4yJAODYLCK+uEiQlbT69BRFP99H80NeHDou2qST9lvViKHGIC9TUn
         7kjyzKm3Q8O97HV6+hgglbN6V6VlY2MLZsAnpomX4FtfRNu/b+fqWke0zKqWEOkPyc5D
         sOdA==
X-Gm-Message-State: AJIora91ViK7kzrZTkdg5Wt9oP8Gj2XM1tn5wWopqEHA+wiO91M8TAvb
	e05o0LCLJqMkZBOnuwtGxmT+cVIPq2s9bOjhK6c=
X-Google-Smtp-Source: AGRyM1vElvHfsICjwWgEtNuET6Waln7ps8J4wWpx5sWQfOASfBqVZvOUkISKsc3DYqxcDxZkIx9pyw==
X-Received: by 2002:a17:907:1b1e:b0:6d7:31b0:e821 with SMTP id mp30-20020a1709071b1e00b006d731b0e821mr854405ejc.334.1655314897073;
        Wed, 15 Jun 2022 10:41:37 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id u10-20020a1709061daa00b00711d546f8a8sm6554709ejh.139.2022.06.15.10.41.36
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 10:41:36 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id h5so16396730wrb.0
        for <tools@linux.kernel.org>; Wed, 15 Jun 2022 10:41:36 -0700 (PDT)
X-Received: by 2002:a5d:47aa:0:b0:218:5ac8:f3a8 with SMTP id
 10-20020a5d47aa000000b002185ac8f3a8mr919424wrb.442.1655314896023; Wed, 15 Jun
 2022 10:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220614213955.eyex4bekp44iroud@meerkat.local>
In-Reply-To: <20220614213955.eyex4bekp44iroud@meerkat.local>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 15 Jun 2022 10:41:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgzRUT1fBpuz3xcN+YdsX0SxqOzHWRtj0ReHpUBb5TKbA@mail.gmail.com>
Message-ID: <CAHk-=wgzRUT1fBpuz3xcN+YdsX0SxqOzHWRtj0ReHpUBb5TKbA@mail.gmail.com>
Subject: Re: b4 Link: trailer disambiguation poll
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 14, 2022 at 2:40 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> One of the suggested solutions is to use "PatchLink: " which is similar to
> "BugLink" already used for linking to bug reports.

Ugh.

I think both of those names are horrible.

We don't do random CaMelCaSe in the kernel for other things, and we
sure as hell shouldn't do it for these things.

We say "Reported-by:" not "ReportedBy:".

CamelCase is a disease. Just stop it.

I think "BugLink:" is silly, because that's just a regular link.
What's the upside of saying "Bug" in there? If you're fixing a bug,
and are linking to reports and discussions by people, what does that
"bug" buy you apart from another ugly CamelCase thing?

In other words, in "BugLink:", neither "Bug" nor "Link" is actually meaningful.

The current "Link:" tag exists AS A GENERIC WAY TO SAY "look, here's
more information". That's the point. The word "Link" has no other
meaning, and trying to then combine it with other things is worthless.

And a bug report is exactly that kind of "look, here's more
information". There's no point in saying "look, this was a bug
report". It's bogus. The link may well point to the original bug
report, but the important part is likely the *discussion* in that
thread. Should we call it "DiscussionLink:"? Hell no.

So stop combining random words that have no worth in themselves. Two
non-informative words does not make for more information. One word is
just a generic placeholder, and the other word is likely misleading
and pointless. Putting them together makes it even *less* useful, not
more so, and usign CamElcAsE takes it from "worthless" to "crazy".

Again, "Link" is just that neutral word that has no meaning in itself.
It's a syntactic thing to give people some very neutral tag with no
meaning on its own. Why would you ever combine it with anything else?

So if we want a new tag for things, just make that new tag.

   Patch:

would at least make SENSE for a link to a patch submission. Although
it's honestly just a big sign that "this link is not worthwhile".

And no, "Bug:" does not make sense for a bug report. That's just "Link:".

The commit message should have enough of an explanation on its own
("Reported-by:" and the regular "Link:" to the report) that there's
*no* excuse to try to make a bug report link special.

We are not going to replace good commit messages with links to
external things, and as such those links should never be important on
their own. They are there for extra context, and a "this was the
original report and the discussion about it" is _excellent_ extra
context.

The only thing that makes that original patch submission special is
that it's generally so *worthless*.  The thing that makes me want
those marked is that they are useless garbage 99% of the time, and if
you want more context for a patch they are usually the last thing you
actually want to see.

Honestly, I still think that patch submission link should probably
just not exist at all.

Are there other links that might be worthwhilte?

Yes: if people want to make patch submission give more information,
then I think b4 should encourage taking the *COVER*LETTER* and make it
into a merge commit, and at that point it's probably worth having the
link to the patch series in that merge commit.

Because then maybe you get discussion about the whole series, which is
more likely to be interesting and worthwhile.

There really is a big difference between "data" and "information". I
think some per-patch link to a random patch submission that is just
the same thing as the commit is worthless ("data"), but something
higher-level may actually give you something useful ("information").

                     Linus
