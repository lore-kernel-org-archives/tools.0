Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04E570;
	Fri, 21 May 2021 07:06:32 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id f11so9874563vst.0;
        Fri, 21 May 2021 00:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kdQS/Xz7KFH2HjCUoyFCRVfYPT4ZHebtLJgr8d+jees=;
        b=s588L1D8vfOUZXqOZVpVSD2GPxheHETnYz/KCO2mPeEjTQSRanbnndxsfFDY0zS6kl
         R+vbv4ja/wbUe7g6NS7zw7AAXnjU+QN27zhViYGvTGpBl9TQqYdC7ky7decQnmlRa5wf
         kdMwPRZpEd70IyTz+uFimtTS0wyT+M8Y58KrSxqtCFGNZrPnqW6RCdnFhpw4/XYrPxXg
         APkAakmlDeCoGF2N6OpX0V7w6WHwWeS0fIbAbcaevK1G1U/WmJcukbT8022J8ym31ByE
         0wVqGdKOe4xSGXOkqEy0q/3MAsygO6gHWCBaSMu3Iu2oCxWWhmEyzumULwyalGOh3wdV
         Hu+w==
X-Gm-Message-State: AOAM531CK6izgCOlCAa1n6CVi4XodldFKU4umIbzehv45m5Gkh/hrqsP
	H96KHhVXhd1usv85QrUCp4w/etyZfrTeg4yTt1s=
X-Google-Smtp-Source: ABdhPJwxk2ACH8YatuWag0c7WKEKG4TNiUSRiSO7fKt9rzbeg4jN5k3mjyOFFkfA1VjuBuzqhUANWGU9kbNUr5vIXms=
X-Received: by 2002:a67:f6c1:: with SMTP id v1mr8530760vso.40.1621580791951;
 Fri, 21 May 2021 00:06:31 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdV7gLtcuW6sCJh3HyWpgwr1rcCEEaDkN2L+chZgVMQTpw@mail.gmail.com>
 <20210520220605.6cnct2wdmjxlz52c@nitro.local>
In-Reply-To: <20210520220605.6cnct2wdmjxlz52c@nitro.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 May 2021 09:06:20 +0200
Message-ID: <CAMuHMdUstawScbrpwiQSMuH54YFXYzB0Dsm9BuXXvFZU77Nz5w@mail.gmail.com>
Subject: Re: b4 not finding explicitly specified patch
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "users@linux.kernel.org" <users@linux.kernel.org>, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Fri, May 21, 2021 at 12:06 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Thu, Jan 21, 2021 at 11:05:51AM +0100, Geert Uytterhoeven wrote:
> > $ b4 am 20210121082248.883253-1-saravanak@google.com -P_
> > Looking up https://lore.kernel.org/r/20210121082248.883253-1-saravanak%=
40google.com
> > Grabbing thread from lore.kernel.org/lkml
> > Analyzing 63 messages in the thread
> > ---
> > Specified msgid is not present in the series, cannot cherrypick
> > $
> >
> > Without "-P_", it downloads a series not containing the patch I want.
>
> Well, only 5 months later, but I do have a fix for this in the current

Off-by-one error: 4 months ;-)

> 0.7-dev:
>
>     $ b4 am -o/tmp 20210121082248.883253-1-saravanak@google.com -P_
>     Looking up https://lore.kernel.org/r/20210121082248.883253-1-saravana=
k%40google.com
>     Analyzing 5 messages in the thread
>     Checking attestation on all messages, may take a moment...
>     ---
>       =E2=9C=93 [PATCH v1] driver: core: Make fw_devlink=3Don more forgiv=
ing
>       ---
>       =E2=9C=93 Signed: DKIM/google.com
>     ---
>     Total patches: 1 (cherrypicked: <20210121082248.883253-1-saravanak@go=
ogle.com>)
>     ---
>      Link: https://lore.kernel.org/r/20210121082248.883253-1-saravanak@go=
ogle.com
>      Base: not found
>            git am /tmp/20210121_saravanak_driver_core_make_fw_devlink_on_=
more_forgiving.mbx

Thanks, confirmed!

Note that without "-P_", it still downloads the series not containing the p=
atch
I specified.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
