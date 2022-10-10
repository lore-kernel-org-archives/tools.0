Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C2C23A4
	for <tools@linux.kernel.org>; Mon, 10 Oct 2022 07:05:31 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id r8-20020a1c4408000000b003c47d5fd475so2727021wma.3
        for <tools@linux.kernel.org>; Mon, 10 Oct 2022 00:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4URLla8M8RvmBjRF9XeGwoWiEU8CSEWlDgEhQ5Nys+Q=;
        b=3ssr439B7Q4uXTioDBnRxvTf+dSBKWPEt3fgZbnLaCOPV4H9Ihc6CIgxGzJwsrLB01
         lWiq+XJhO4xaQNpUvFkB97BhtRPe4IR+r4XeKAVdZgBcVHW0JKhVdx0/gsM5xKcqN2+M
         T3NC+dakEXlmOI+txI/dc+xvO7E9Qc3A2bb2avm9PJZdb3JDhUXss5lFBWxtO/3QgAYR
         dVG+X7weKGZvvIMB+X/M8x8W5SpbhMrPApUBv9ho2FnqvqoEPlab6kdrydR4jJrGRxEY
         FXUwrOTKdoKENpsHR8yZhVjssg13P8v/F96udrOluKavcHoekTW8uob8KDD9fxNddnsN
         +KAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4URLla8M8RvmBjRF9XeGwoWiEU8CSEWlDgEhQ5Nys+Q=;
        b=7rvqkU1d8kRH47xbAKGlE0QT8/0CFZzWFLccxpkZK8HO7pW9A277cEGXR5zlzLQmin
         xxNB7ck5ytRKC8FuX2/z2kD02GEYQXAT2KMko6Ajbn6QLkz4FEjGCWMoevyrNnCrfpyU
         tt+gf0fk+ubf4O74abGDQtGdZEMnG4kfJJYu4xipBGUj07e0uunrRbvlG4khVd1KNXTy
         I6zddjN0cIQw3kytvMa2H2FNGO3ANevyrT3DkYb15S7X/6Bz0yTO1l9T0BOlnSJLUuWz
         rJslQDENvnYZZOLVc/qtusiNV+wbfmyll3pEtkNDF75Q6AWQgUwIFivcDl+heMDwZhpW
         Katg==
X-Gm-Message-State: ACrzQf0aP+cuQCDW+uWJ3qdXxSJf9nt/AxkNqNntyC3RFcqGVAKNpKhT
	xY7W+vnEOpndMxBhsljdwQRn8w==
X-Google-Smtp-Source: AMsMyM550gDTHglBHsa61n5zDBQMuw5KbP+lmtAUfXW9ZPeODfWKq2aa3+SEhEqsO6D4Chb8e/9JfQ==
X-Received: by 2002:a05:600c:1547:b0:3b4:c56b:a3a6 with SMTP id f7-20020a05600c154700b003b4c56ba3a6mr11740240wmg.29.1665385529579;
        Mon, 10 Oct 2022 00:05:29 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:5824:6e63:e7a6:5af])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d654e000000b0022abcc1e3cesm7992619wrv.116.2022.10.10.00.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 00:05:28 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Amjad Ouled-Ameur
 <aouledameur@baylibre.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 cover-letter in single patch submission
In-Reply-To: <20221007180808.bhqo4do4ultivud3@nitro.local>
References: <3b1af982-83f1-d5ed-6df1-c654df481899@baylibre.com>
 <20220922180119.jnggtlpwu5yhxoc7@meerkat.local>
 <5eb13320-bbc6-42ff-9161-24b789292098@baylibre.com>
 <01b74898-c1b0-3837-26e5-193339b74267@baylibre.com>
 <20221007180808.bhqo4do4ultivud3@nitro.local>
Date: Mon, 10 Oct 2022 09:05:27 +0200
Message-ID: <87tu4cp39k.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven., oct. 07, 2022 at 14:08, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> On Tue, Oct 04, 2022 at 12:08:36PM +0200, Amjad Ouled-Ameur wrote:
>> Hi Konstantin,
>> 
>> I have tried v0.10.1, cover letter is no longer sent when dealing with a
>> single patch, thank you for the fix. However, the cover letter is instead
>> embedded into the "under-the-cut" portion of the patch, this means the user
>> still has to unnecessary fill the cover letter ; because keeping the cover
>> template as-is will result into "b4 send" failing. My suggestion is not
>> include the cover's title and description into the patch, I think keeping
>> only "base-commit" and "change-id" is enough.
>
> I felt there were good reasons to go with the solution that I put in place,
> specifically:
>
> 1. keeping a separate cover letter makes it easy to keep track of changelog
>    entries
> 2. breaking a single patch up into multiple patches is a very common feedback

I agree with Konstantin on this. I've used b4 for single patch sending
as well and to me it works well the way it is today:
* changelog (for the single patch) is done in the separate commit
* changelog is then appended

I do remove the "commit title" from the cover letter commit to have a
better overall format.

>
> One of the biggest problems I'm trying to deal with right now is the fact that
> cover letters are so free-form. When we encounter a cover letter format that
> we don't recognize, we're likely to do something wrong.
>
> I'm considering enforcing the cover letter format to be more rigid -- at least
> when managed by b4, but I'm likely to encounter resistance from users.
>
> -K
