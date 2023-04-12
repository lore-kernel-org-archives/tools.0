Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F9E3C02
	for <tools@linux.kernel.org>; Wed, 12 Apr 2023 19:24:08 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id cm23so3713674qtb.3
        for <tools@linux.kernel.org>; Wed, 12 Apr 2023 12:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681327448; x=1683919448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jiGA+JYTMnotDxP3300iA3DA7koIimm8YkzVrLc7HQ4=;
        b=SVs37zv6HHSSIT8yTCIP2+isTvF6EoKTFqwjU3dLOogBMLyKVZ5CApNF2SMzRMSuno
         9TiDUEWh+wevvZdAuRfbJw/NtdYZds2zDKsjghphdWUvn3sQIq1PeWJQPdk7xAB+4PBW
         VjSp33RCOzzounjV7vialKuNP9QlzlT2Vyq+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681327448; x=1683919448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiGA+JYTMnotDxP3300iA3DA7koIimm8YkzVrLc7HQ4=;
        b=E3tOevZbUWShk/Sa/CbkyLPhTHiW92n2ivtplamdS4ZboqNjrLtaXnJR/lDHIL3hHE
         JfDSEOQM+fh1q5XGitNhssTEU10IEDjaGokBGdTzb/KKO/sGGSSPPDdijOogzbOKGvMH
         WpaDjpn3vwkOdNZ3yf31GVVWQea6Rw7WJ8dk4JADDoo5/jqU5xdO/z8fv9S3ZhS2GJxa
         lqBCPl2uBN2GJbScdVE0qTWS5sS/7QDXy+dbCXVoFNWMXLGB8l+F0KtGohcgSvm5OJ+v
         pMCW8qBngC87a6rtxgZzmsNG0x5T+qnQ5cm7ZasFN7fOLrgue2jtBwDfXorfDTl8kPGL
         i/Mg==
X-Gm-Message-State: AAQBX9eL7U9MuAqzTu8C2lh5SXj6+CP6NyU940EHiUaEbr9xjgjkGo5D
	NU5NU6MebeBgq58UXP1Trxua4Y8Ml3PxAiV91Io=
X-Google-Smtp-Source: AKy350YMO2/tDVmOrS3ancR+bojRskSZZDOvmRKFvNpGJ0RW5FYQ9IPAJsk/6hnHRY34Rp3mr9F4/g==
X-Received: by 2002:ac8:5ac7:0:b0:3bf:c3f9:70a3 with SMTP id d7-20020ac85ac7000000b003bfc3f970a3mr31854009qtd.26.1681327447853;
        Wed, 12 Apr 2023 12:24:07 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id d7-20020ac85347000000b003e3982a6f2bsm4424030qto.18.2023.04.12.12.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 12:24:07 -0700 (PDT)
Date: Wed, 12 Apr 2023 15:24:05 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: icon@mricon.com, tools@linux.kernel.org, mjg59@srcf.ucam.org
Subject: Re: executable sendemail.smtpserver and b4 --reflect
Message-ID: <20230412-smokiness-portal-833f99@meerkat>
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>

On Wed, Apr 12, 2023 at 12:00:09PM -0700, Nick Desaulniers wrote:
> $ b4 send --reflect
> 
> it seems that my series was sent to the list, surprisingly!
> https://lore.kernel.org/llvm/20230412-no_stackp-v1-0-46a69b507a4b@google.com/

Yes, this is bad, as the warning message specifically says that this won't
happen.

bugbot assign to me

> Internally at my employer, I must use a command line utility to send
> email outside of the blessed GUI.  As such, my ~/.gitconfig looks
> like:
> 
> ...
> [user]
>         name = Nick Desaulniers
>         email = ndesaulniers@google.com
> [sendemail]
>         from = Nick Desaulniers <ndesaulniers@google.com>
>         smtpserver = /usr/bin/sendgmr
> ...
> 
> From a discussion with you and Matthew on IRC, it sounds like this
> company-internal sendgmr utility might not be respecting some header
> b4 adds to the eml file (envelope-from?)?

What happens is that we expect that whatever we talk to will ignore the To/Cc
headers in the message and only send the message to the recipients specified
during the outer exchange (e.g. SMTP ignores anything in these headers and
only pays attention to the recipients passed in "RCPT TO"; the same is true
for actual "sendmail" command). 

The safe course of action is to bail on --reflect when we recognize that a
local executable is being used, because there is no guarantee that it will be
compatible with our expectations that To: and Cc: headers in the message will
be ignored.

> I can file a bug internally, but I'm not well versed on how to clarify
> precisely what's going wrong.  Is there anything to be done in b4
> itself, or help me word such a report I can file internally?

I'm not sure it's worth your effort for this particular case, as sendgmr
doesn't claim to be sendmail-compatible, it's a tool to use with
git-send-email and *deliberately* pays attention to To: and Cc: headers in the
message. To be sendmail-compatible, it would need to ignore To: and Cc:
headers in the message and only pay to recipients passed as command-line
arguments, unless -t is specified (e.g. see
https://man7.org/linux/man-pages/man8/sendmail.8.html).

> I also noticed that my name wasn't being sent on the From: field to
> LKML. I assume that's an orthogonal issue, but is there anything else
> I should be doing there?

Do you have "from = " set in your [sendemail] section?

-K
