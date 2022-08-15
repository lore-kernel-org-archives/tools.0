Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AC17E
	for <tools@linux.kernel.org>; Mon, 15 Aug 2022 17:05:22 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id mk9so5763498qvb.11
        for <tools@linux.kernel.org>; Mon, 15 Aug 2022 10:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=zXg1+SPK/wnXACE2sAcAZ1uSMIEeUCEhfR+t/TRGBDo=;
        b=I5qp6BCoiRA/ICcpeOSUtvC9pErDjk4ocXuMJML35kvvFjALascyfPwxxXo40ruehL
         Z8iYw45dt2J3+hw9XPxpagEF1nEYtB2pqlJpywjJhdGQWUwqxvvElPZ/nzQWdi65FFeK
         jZsL50sPfA+KblFGnU8VXthskCiLzoSHn09RQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=zXg1+SPK/wnXACE2sAcAZ1uSMIEeUCEhfR+t/TRGBDo=;
        b=Buf2odZ0BVcoXK2MISNKpThmVJY4CB0AUuVAUhPQQZqsOUPfVohiMZFG6UiXJtpi6G
         rY3bl1nTkfaV2ovCx6KnyPh1+lHk0Z7eBbCfUh46PG/fTLB16t3FrXnZ7tx4iuw+t/uU
         tZVziNWUJmTw0ebryfZz9knkvOyg6ONminGd9NIlQ3LWAe2tbbx5TM9qjpiPulWPtEMN
         v9bG3RpJoT1aoMoWq225aKer52RRLCpmAULAq3LAmwKvpFpA3eXU4WQAvA04yKLe1Dma
         evTCuDJsfXO83qXO758jFiqrO7XL0xb7w5fEZxv+jpWImKnWXpc4O9msE+bWIadqsVlm
         0Rgw==
X-Gm-Message-State: ACgBeo25H4ln9/qJUiVtxULLGEJaebZSdmXLldScluInmWKsnimsPUjO
	iiLNHlAwUECQRZfvvTOATe1HGA==
X-Google-Smtp-Source: AA6agR67VPtgbN4x4H8gq8AUN0y0joa2jlLpyVv+HG+KGIzS2hGbtvwHrPTzWg6fSIO93N+lq91Y6g==
X-Received: by 2002:a05:6214:76f:b0:47b:31f3:db89 with SMTP id f15-20020a056214076f00b0047b31f3db89mr14269232qvz.68.1660583121578;
        Mon, 15 Aug 2022 10:05:21 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id c9-20020ac85a89000000b0033aac3da27dsm9129541qtc.19.2022.08.15.10.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 10:05:21 -0700 (PDT)
Date: Mon, 15 Aug 2022 13:05:18 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 submit ready for beta testing
Message-ID: <20220815170518.ydthz47bfz4myggq@meerkat.local>
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220728160418.sgfns5jsisjsz5hr@penduick>
 <20220728162434.eedqnx42sezb2vbe@meerkat.local>
 <20220815161757.yr5vkjuoulsy226g@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220815161757.yr5vkjuoulsy226g@houat>

On Mon, Aug 15, 2022 at 06:17:57PM +0200, Maxime Ripard wrote:
> I've used b4 prep a bit more, and a few more rough edges:

Thank you for reporting your findings!

>   * If the repo has untracked files, b4 trailers errors out. Adding
>     --untracked-files=no to the args list of git_get_repo_status
>     makes it work fine.

Yes, most of the time we'll not care about untracked files for this work. I
added the flag as default setting.

>   * b4 prep -n will create a branch with the tracking commit last, but
>     b4 prep -e will add the commit first.

I assume you set your strategy as tip-commit, right?

Can you give me some further details here? "b4 prep -n" will create a brand
new branch and create the cover letter commit right at the tip, so it's the
only commit past the fork point. Is that not what you're expecting?

>   * If we have a branch tracked by b4 (and using a tracking commit), and
>     we want to enroll another branch based on that first branch, b4 prep
>     -e will refuse to enroll it stating that it's already tracked.

Yes, I have not yet implemented a way to have more complicated topologies than
that for all strategies. I.e. this works:

-A-B-C
    \-B4A0-B4A1-B4A2
    |-B4B0-B4B1-B4B2

But I haven't really tested various gotchas of this yet:

-A-B-C
   \-B4A0-B4A1-B4A2-B4A3
                      \-B4B0-B4B1-B4B2

Which basically means that multi-series are not currently supported -- but
they will be once I get most of the basic kinks out.

Best regards,
Konstantin
