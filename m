Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229E74A35
	for <tools@linux.kernel.org>; Fri,  7 Oct 2022 18:08:11 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id cn9so3254167qtb.11
        for <tools@linux.kernel.org>; Fri, 07 Oct 2022 11:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CyWYjJ5tAaZrxkd0uuHI3K9YIVDh7Ugx7lvNkBYJM30=;
        b=Wbm+yt7Rg+lEMDJ4KMB2QWz1qU6Pt0WzlJcBac7IvnQyr/NPZSnIT1OStKRCJZsxr9
         YvmmOANkLjxj86ar09e6K8zrda5gxuDd79bh9JVauOycHekrAyh1MH9awhYAlrudXKZJ
         gMW/mexXlL7Q7OvlW2zTGFeB54xQXixUfXOtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyWYjJ5tAaZrxkd0uuHI3K9YIVDh7Ugx7lvNkBYJM30=;
        b=ZaRGX5xeggoAgLFeY77GcYSkis306syVLR/vX7VcYZbX3aqcA443NXbm/6eBVVlaID
         gGywr96N7wZ83TeJWbI8BB6e6IlxY6T/ixLP1H+fOG8SMPofVh5wYj5Tu0dRDz8vrkYA
         +vW34bK/qUInPvNAcVE8I+BSCnDdA4++PkFL0+KIxH9m74myPe/mJnQzj/B+ij8A4lIS
         Z1GxqsjeItB43Iw8ZAD/c+thj4eZDa36OEJ6KFmSmP2oUHvk6hMPoSifwi7uqcqYKkQ8
         EL9QkOzbGP3meAN0zu4y3GeB5OFPogOASZO/CPamf4JAX7TkedY5K8zFm0/h1+n1Hv1P
         /t/w==
X-Gm-Message-State: ACrzQf0doBUCC27vfpi337aRyiYaa4tdmsjh/SdTTsP39Sp8wh6cLTim
	dOAi81ZtMdcdpFEXigdHu2L5vA==
X-Google-Smtp-Source: AMsMyM6R9IEldAY8/UHqmLegojag0dSFmvZG+i3p3/SnwmytJ6Z7YbTdOGB3R4sXETQT28Wxlj+U6A==
X-Received: by 2002:a05:622a:1aa8:b0:35c:c831:d601 with SMTP id s40-20020a05622a1aa800b0035cc831d601mr5249641qtc.434.1665166090951;
        Fri, 07 Oct 2022 11:08:10 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id o19-20020a05620a2a1300b006cddf59a600sm2752986qkp.34.2022.10.07.11.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 11:08:09 -0700 (PDT)
Date: Fri, 7 Oct 2022 14:08:08 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 cover-letter in single patch submission
Message-ID: <20221007180808.bhqo4do4ultivud3@nitro.local>
References: <3b1af982-83f1-d5ed-6df1-c654df481899@baylibre.com>
 <20220922180119.jnggtlpwu5yhxoc7@meerkat.local>
 <5eb13320-bbc6-42ff-9161-24b789292098@baylibre.com>
 <01b74898-c1b0-3837-26e5-193339b74267@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01b74898-c1b0-3837-26e5-193339b74267@baylibre.com>

On Tue, Oct 04, 2022 at 12:08:36PM +0200, Amjad Ouled-Ameur wrote:
> Hi Konstantin,
> 
> I have tried v0.10.1, cover letter is no longer sent when dealing with a
> single patch, thank you for the fix. However, the cover letter is instead
> embedded into the "under-the-cut" portion of the patch, this means the user
> still has to unnecessary fill the cover letter ; because keeping the cover
> template as-is will result into "b4 send" failing. My suggestion is not
> include the cover's title and description into the patch, I think keeping
> only "base-commit" and "change-id" is enough.

I felt there were good reasons to go with the solution that I put in place,
specifically:

1. keeping a separate cover letter makes it easy to keep track of changelog
   entries
2. breaking a single patch up into multiple patches is a very common feedback

One of the biggest problems I'm trying to deal with right now is the fact that
cover letters are so free-form. When we encounter a cover letter format that
we don't recognize, we're likely to do something wrong.

I'm considering enforcing the cover letter format to be more rigid -- at least
when managed by b4, but I'm likely to encounter resistance from users.

-K
