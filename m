Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8906D18
	for <tools@linux.kernel.org>; Wed, 14 Apr 2021 12:52:05 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id 6so16965959ilt.9
        for <tools@linux.kernel.org>; Wed, 14 Apr 2021 05:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Fj5ukuarT/mrQxhpZxMzVYgJkCKaoHFyHy1W58/1qYs=;
        b=cbbNLI4P6xKtgyj6Mmo+7YCZIQT4BMOeTyCFHH2XaZweYVLU/ikHga3RON4ONAe6aa
         51fdSAXbCMdIxZSnES28zEhyfctLr2Cm9pu7rPlkmVI8EXFyLD2dueSzM+UTVXvhV43+
         i+wLE2Xh/yAC3DZItyNv6eXLWZuUeRr6rdTRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fj5ukuarT/mrQxhpZxMzVYgJkCKaoHFyHy1W58/1qYs=;
        b=sHKDm6KWrOJf/2fNriHr0oUaQXMGqN7nhL+7F1RO3ARiPRlgIPZVTS57XAeCBxMR4O
         jL9fYI61rN9owPseHRJeiGO0XAYqFd2rOuYxsj575w//fQcCVQMbp8ESswpX40JPdW9U
         pKRe6zziBxUTjA4bqxpF1JPRaW6dvuLy+eEgVjg4KAgs+1bi81cfpvFB3Fz0tgzNsXhM
         XDKsjOv2icsDLAr68tyIgApa9wu/Vt6JjxVbmVBEWM0ndIy6iQVyB1r+j1jgiwuwQCR/
         WUsA/TWb86TsXSUr+pbxSgKGNtX8JBF4wP4LggADV0OlQlIcFs0tUMn0pIEuqHLG1zwh
         f8QA==
X-Gm-Message-State: AOAM533U9K6p4kJVbf1a77GBCsdmyV/t7pGS9ls8Ev9aSmwczxybtJr7
	7KGFH3TFrrFtnPfx+TjjFusnVEEJ1QKT/w==
X-Google-Smtp-Source: ABdhPJxidQcpj6SJS4UpCu1kmI6hVHPpUg6kEIIBk1x8ElayBH6kbrxHx0eeWhia65XwZNrIlAYY5Q==
X-Received: by 2002:a92:d58e:: with SMTP id a14mr30981583iln.135.1618404723812;
        Wed, 14 Apr 2021 05:52:03 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id r16sm2197204ila.1.2021.04.14.05.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 05:52:03 -0700 (PDT)
Subject: Re: RFC: Superseded-by: follow-up trailer
To: Steven Rostedt <rostedt@goodmis.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, users@linux.kernel.org, tools@linux.kernel.org
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
 <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
 <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
 <20210413172901.1465307c@gandalf.local.home>
 <20210413214031.fenjvgh5helyuqdz@nitro.local>
From: Alex Elder <elder@ieee.org>
Message-ID: <f24ccee5-a655-9928-100c-551c4f6054fc@ieee.org>
Date: Wed, 14 Apr 2021 07:52:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210413214031.fenjvgh5helyuqdz@nitro.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/13/21 4:40 PM, Konstantin Ryabitsev wrote:
> On Tue, Apr 13, 2021 at 05:29:01PM -0400, Steven Rostedt wrote:
>> Now, I would really like the Supercedes: tag, as its just a link you need,
>> and not a email sent. Ideally this would be in all the patches (with a
>> direct link to what it Supercedes. I may update my scripts to do exactly
>> this, as I always add a "Link: " to the last version, and that's in my
>> repo. Or perhaps b4 could add this too!
> 
> I'd rather folks used the following notation in the cover letter/patch
> basement:
> 
>      Previous versions:
> 
>      Link: https://lore.kernel.org/r/foo # v2
>      Link: https://lore.kernel.org/r/bar # v1

I had a few thoughts about this last night.  I hope this
isn't too rambly.

I haven't been using this to tie together versions of a
series.  But I think it's a good idea and I will start
(possibly after the dust settles on this discussion).
It implements at least part of what Doug Anderson sought
when he advocated including a Change-Id tag to track
related versions of patch series.

This practice is the developer's responsibility, not the
maintainer's.  I don't find that tracking the link down is a
very big burden.  And checkpatch.pl could be taught to look
for such links and suggest them for any version after the
first.  This probably isn't the "helpful common tooling"
that Jason Gunthorpe mentioned, but using checkpatch.pl is
a common expectation of developers.

I assume these links are pointing to the first message in
the series--which would be the cover letter assuming there
is one.  I have no interest in finding (or seeing) links
like this for every commit.  This suggests that developers
should always include a cover page for multi-patch series;
is that now required?

If this information is in the cover page, then maintainers
should preserve it by including the cover letter in the
merge commit.  I know this was a recent topic, but I didn't
follow it close enough to know whether that was the conclusion.

For single patches, I'd rather have the link be under the
"---", and have the link field added by the maintainer be
the only one committed.  I think I'd also prefer just
having a single link to the previous version, rather than
including a full and growing set of them in each version
(but that's only a slight preference).

> This is much more succinct, indicates the version number in the trailer, and
> removes the need to remember how to spell "Superseded", as there seems to be
> little consensus. :)

I retract my earlier spelling of that word.  Here too,
checkpatch.pl could ridicule anyone who spells it wrong and
we'll all figure it out eventually.

I like the succinctness of "Link:".  It is flexible enough
to be interpreted as a "see also" reference rather than
just "the patch submission correspondence is here."

On the other hand, it lacks specificity.  It's possible
that having distinct tags would be helpful for tools.

And finally I hope this practice (however it ends up looking)
is optional, to avoid adding yet another learning hurdle for
new developers.  Individual maintainers can require it or not
as a matter of their own policy.  I realize that reduces its
value.

					-Alex

> The tooling on the kernel.org side can automatically send the required
> follow-ups to previous threads when it finds these trailers in newer
> submissions.
> 
> -K
> 

