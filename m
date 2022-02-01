Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9372C82
	for <tools@linux.kernel.org>; Tue,  1 Feb 2022 15:41:18 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id s6so16316886qvv.11
        for <tools@linux.kernel.org>; Tue, 01 Feb 2022 07:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pu4ERIFmW1jWc1Bd0PZM5DqO1VeqWS/aqExXm9m+JnA=;
        b=c5I+r3ODSGoo3wvdKKAkaABY1xZWA1vJ2wkGekwayQ87PucFgVmmPlLlH11EWpJWc8
         r0HhVq+TqP76ApHDmcldXNuk/xuD7bBCA7Kmth6APIFD293gSi8Pm9VluaIA9Ebz/Nsp
         3+BcQFZY0YqLifaL2CMqVrjf4qhzFDP0dzH6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pu4ERIFmW1jWc1Bd0PZM5DqO1VeqWS/aqExXm9m+JnA=;
        b=gJgtayOnq59QEIL2bcwhnXo8F8Ys1VTb/sToTyy9QLMTBV+1M2A9w7veJ9h4d2s2I5
         jwphFI2CMZ7Z/W00y7zxIhP3RedP1lL07yYw08Z4JbwegXmVrbXw0uC2SWZkdPC8MikL
         UiPQI9DkTU2DqhkrvK3z35IIP8hNsWtI2qQrE2VZSI+nqPxJgoHil3YSZ7kjCvSSnDw/
         V6pxZH4MWr32MuDTUqclLptjrTCiPhHfH+MnQY6w3g/FiggW/IJrNEc0dRW4ITKXJz7H
         0DpRdI+TeNr2zmhbqBuFHpInygWSDG2mMHrqLhesfJ2/ESQVffGuaCoiNAMYPNd3mO1j
         HOdQ==
X-Gm-Message-State: AOAM533vbSBdJ24f0GMDCJKkFvilsrMo9VyW2paiKdrJBhBjcHFs/vft
	Z114lSUqIV4DtCEd4694nuZWvg==
X-Google-Smtp-Source: ABdhPJw0vw2N3buDYcenXSQvBNSjnXDl+4vDfQi7eDfG2IhheJ0LpQMpT2fiUV8FXPv5PWIgPDw+7A==
X-Received: by 2002:a05:6214:e46:: with SMTP id o6mr22711553qvc.5.1643730077686;
        Tue, 01 Feb 2022 07:41:17 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-127.dsl.bell.ca. [216.209.220.127])
        by smtp.gmail.com with ESMTPSA id r14sm6458826qkp.48.2022.02.01.07.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 07:41:17 -0800 (PST)
Date: Tue, 1 Feb 2022 10:41:15 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Allow whitespace before a trailer
Message-ID: <20220201154115.dp75wozotcmgyjdg@meerkat.local>
References: <20211214214327.4003631-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211214214327.4003631-1-robh@kernel.org>

On Tue, Dec 14, 2021 at 03:43:27PM -0600, Rob Herring wrote:
> Currently, b4 fails to find and add trailers with leading whitespace. Let's
> be a bit more forgiving and allow for that case.

Okay, I think this is fairly safe and hopefully won't result in more
false-positives.

> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> This thread exhibits the problem:
> https://lore.kernel.org/r/20211206174113.2295616-1-robh%40kernel.org
> 
> Note that patchwork also fails on this. Between fixing b4 or Greg, I 
> went with b4. :)
> 
> ---
>  b4/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/b4/__init__.py b/b4/__init__.py
> index 11c287eb3433..a4add56c5f80 100644
> --- a/b4/__init__.py
> +++ b/b4/__init__.py
> @@ -1397,7 +1397,7 @@ class LoreMessage:
>          was_trailer = False
>          for line in body.split('\n'):
>              line = line.strip('\r')
> -            matches = re.search(r'^(\w\S+):\s+(\S.*)', line, flags=re.I)
> +            matches = re.search(r'^\s?(\w\S+):\s+(\S.*)', line, flags=re.I)

I used a \s* instead, since there may be more than a single whitespace
character. It's in master and stable-0.8.y.

>              if matches:
>                  groups = list(matches.groups())
>                  # We only accept headers if we haven't seen any non-trailer lines

Thanks,
-K
