Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84927A
	for <tools@linux.kernel.org>; Tue, 26 Jul 2022 08:37:21 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id l15so15082484wro.11
        for <tools@linux.kernel.org>; Tue, 26 Jul 2022 01:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
        bh=/wKZDlSNEgAPTXMaOdErdEWusHUJy3tle/Vw4jbFYQM=;
        b=bpDYC8UhgDRC0DIzTPk69febQPVuJRbH0B/nCA8ij3TnkJRLBDJ5teqoR7QE8R2HYW
         k29hpwXD0oJEVIeKWM0bKR8/vQTjfEOAdnRk0bsRi519tHGhf3HspVzFTR4/YpOkJfzO
         zRXQbeshNQ0bdpp3yN5ze22OIUtDZx4RitKBPmaWUSCqhXKud1JdHb3vWrkrwl6ehBCa
         ZqG+R5ek0H0Xq2OmpS2dXDqbaOZ7YXIZ6DDYGgLyqYqsrTYmgYUPM6NCqCvDz13Whdt1
         lST62Yeednqk0EF6BRgIYU+6w6WYTxXBZOoT8cUruSkUq0vaV7PxQSXO8KWH9yeCUbCm
         ScLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=/wKZDlSNEgAPTXMaOdErdEWusHUJy3tle/Vw4jbFYQM=;
        b=q2m2UUGtyJUmj3eHJjLbhyJMVGvBfHDW+ufN5wfxKGD3HO4mTHHyGMFjQari/xO1NU
         F69ojhS4c+H6EKWpYdlYBWUdzPv599mMp8Ky1kdmruJmSTvalGhJdGokDuza9SyOb7O1
         ppjI/pPed4X2ejlF3GUNJ7RIFjzNEiZrb8moIFxIAKLA8aoaxMfbhO8/wOEBVMtxVVhr
         Va+EAwaKr/RP6y1BC9AWtlbi/XFBagH+qyBMwxo/0WvIo6g9bvH+do5qMbln2C+GOZHK
         EDHLCgOPeatBhkpg2yKn3tjSHTRMsPSvqbbeY6BNg8GXtcfowKIP0RdPTP8W5r9XT4dT
         QZuA==
X-Gm-Message-State: AJIora8gNdmZcCxr/xzu8Ufvi/m3voiEu37JdUeU2HXQ0b8RKY01EZLx
	VjG63lMGSJ61Ojbp+o6OeWQXOA==
X-Google-Smtp-Source: AGRyM1szu3l1jt+eUtbmkULdc8jeORltoobayWOfcn/7vGn+yD5x8TrNv6E9Nl94Ezeyu2CgRPqtrg==
X-Received: by 2002:adf:e38c:0:b0:21d:6df5:f7da with SMTP id e12-20020adfe38c000000b0021d6df5f7damr9464786wrm.265.1658824639984;
        Tue, 26 Jul 2022 01:37:19 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id r11-20020a0560001b8b00b0021e6baea4ffsm9852591wru.29.2022.07.26.01.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 01:37:19 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
In-Reply-To: <20220720184835.uhnkucai54alhgo6@nitro.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
Date: Tue, 26 Jul 2022 10:37:18 +0200
Message-ID: <87pmhs1d8h.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Konstantin,

Thank you for the new version. I will use it for v2 of these series:
https://lore.kernel.org/all/20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com/

On Wed, Jul 20, 2022 at 14:48, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> Hello, all:
>
> Based on your feedback, I've refactored the submit functionality and it's
> ready for some more poking and testing. Here are the implemented changes:
>
> 1. Pluggable cover letter strategies
>    The goal is to support 3 different cover-letter strategies:
>
>    "commit": same as first implementation with the cover letter stored in an
>    empty commit at the beginning of the series.

I'm still using the "commit" strategy.

>
>    "branch-description": stores the cover letter in the branch description
>    (which really just means the git config file). The cover letter can be
>    edited using the same b4 --cover-letter command, or just with "git branch
>    --edit-description".
>
>    "tag" (not yet implemented): will store the cover letter in tags a-la
>    git-publish.
>
>    The default cover strategy remains "commit", but you can switch using
>    b4.ez-cover-strategy, e.g. in your ~/.gitconfig:
>
>        [b4]
>          ez-cover-strategy = branch-description
>
>   Note, that switching from one to the other for existing tracked series is
>   not supported (and I'm not sure will be). It's also not currently possible
>   to enroll an existing branch into ez-series with the "commit" strategy
>   (because I haven't yet figured out how to insert a random commit into
>   history with git-filter-repo, but I'm sure it's possible).
>
> 2. "b4 submit" command got split into 3 different commands:

While I do agree that these commands make life easier, I don't think
that we should "ez-" as a prefix.

The "ez-" part has, in my opinion, no added value for users. It
assumes that using these commands is so easy that "you can't use it,
you're really incompetent". I think we should use more "neutral" langage
for commands (without judging if it's easy or difficult).

How about:
- b4 series (for creating/handling series. Also includes "send"/"submit")
- b4 trailers (for handling trailer updates)

>
>   - "b4 ez-series" to create/enroll branches and manage cover letters
>
>   - "b4 ez-trailers" for retrieving trailer updates and updating your local
>     branch. Note, that with -F this can run on any branch, not necessarily the
>     branch managed by ez-series. E.g.:
>
>         git checkout arbitrary-branch
>         b4 ez-trailers -us -F [arbitrary-msgid]

Using "b4 trailers" versus "b4 ez-trailers" seems also to document
better that this commands applies on all branches. (not only ez-series branches)

>
>   - "b4 ez-send" for sending the series to the mailing list. It has all the
>     same flags as formerly for "b4 submit", e.g.:
>
>         b4 ez-send --no-auto-to-cc --dry-run

In my opinion, "b4 send" should be part of series because we cannot send
series that were not created with "b4 series".

>
>     There is no more --reroll command, as using ez-send will automatically
>     increment the tracked revision number (unless RESEND was in the prefixes).

This is very useful, especially the cover letter boilerplate update.

>
>     There's still no support on the web submission endpoint, but it's coming
>     in the near future.
>
> Thank you for everyone's feedback, and please continue testing it out. If you
> want to test the dev version of b4, use the same instructions:
>
>> ## Getting the b4 dev version
>> 
>> To install the b4 development version, you will need to run it from the git
>> checkout:
>> 
>>   git clone https://git.kernel.org/pub/scm/utils/b4/b4.git
>>   cd b4
>>   git submodule update --init
>>   alias b4="$PWD/b4.sh"
>> 
>> You can find out more details in the README file. You will also want to make
>> sure that git-filter-repo is installed (either from your distro packages or
>> from pip).
>> 
>> If you're already running b4 from the git checkout, make sure you run "git
>> submodule update" to pull in the latest unreleased patatt version.
>
> Best regards,
> Konstantin
