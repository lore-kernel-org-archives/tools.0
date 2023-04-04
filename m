Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705FD28F3
	for <tools@linux.kernel.org>; Tue,  4 Apr 2023 16:51:18 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id x17so10104314qtv.7
        for <tools@linux.kernel.org>; Tue, 04 Apr 2023 09:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680627077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rBYlOhVpVWV66mR9T6+6SfkcKzkFI00hTFvwWEVBEgg=;
        b=LhGR8C8RvOQJk68bfgB14MpFpp9/e/xdf5ufWlLyqC5JCjwhjYldyWlI9NPamKPInF
         PREem3lFH1MG61IZRx8NTR40xCUY+eU6ZRJBvdWjYi+7UeNKVCdi+5Ervcuw4lSVl/id
         M1GJn1aGHDkNjG+sOfehj81OfN/T76R3t2RUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680627077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBYlOhVpVWV66mR9T6+6SfkcKzkFI00hTFvwWEVBEgg=;
        b=R697sVBYQDHHhFlyPvnkL9GDbKypdckoneGjo/ITqIRPUNilFjgzef/BpwNlmPzr3J
         RK8i5JnxAMXDjii5yVcgQBZc8zskE/B3tSCaGSxZqIcPjFPBsM0afuPENFVevsGaettd
         c0yR08SX2vONxMfuM/YT1E8uR2A/huTiOgpNlfj7jbl4zPyEKyAYbGYbHiubXkd5NoUJ
         l0KDYH42sKPN153jx1nTpW9sf6kInCammUfx+eMNwsbZsl+/ExnaUqW0j8+2ibsuJn0q
         6/gKhM6n1Q/AtDQs5w2vtOn3zS7k9BK6xFuKfPIuOfYSGcjlnbOOcUkyy7wrP8Povgli
         vR6g==
X-Gm-Message-State: AAQBX9f3jZzNOv9SrntScPzFLk+9excHXyRnMOhO9s0skSAuKHu8xgfB
	GKTNzKw+uo+Nr3AjlhJeopxlG/BFikR2XfS4i80=
X-Google-Smtp-Source: AKy350YisxleKMNbf0SY14L2lUcQMjnDhFN7Sn09NIZekakU3fgJS7VPMTMvyqix89qw9wI2P7F0Zw==
X-Received: by 2002:a05:622a:3cf:b0:3e6:3c76:84b1 with SMTP id k15-20020a05622a03cf00b003e63c7684b1mr130644qtx.31.1680627077158;
        Tue, 04 Apr 2023 09:51:17 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id o26-20020ac841da000000b003de4e646d63sm3382992qtm.32.2023.04.04.09.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:51:16 -0700 (PDT)
Date: Tue, 4 Apr 2023 12:51:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 having trouble parsing recipients from cover
Message-ID: <20230404-oblong-mower-6b4fba@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
 <20230404-bacteria-refinery-a97393@meerkat>
 <ZCwlhTvZhpVXBj6/@sirena.org.uk>
 <20230404-tummy-lusty-057598@meerkat>
 <03f33806-d61f-47ce-9c0c-f3cb0a7a6302@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <03f33806-d61f-47ce-9c0c-f3cb0a7a6302@sirena.org.uk>

On Tue, Apr 04, 2023 at 04:03:54PM +0100, Mark Brown wrote:
> > > I've got a cover letter commit for a single patch with the contents:
> 
> > Does it work if you add a single line title at the top?
> 
> No, same behaviour (I just added a line with a couple of characters
> rather than a full subject).

Okay, you can work around this by adding --- between your trailers and the
changelog:

	Signed-off-by: Mark Brown
	---
	Changes in v2:

I'll work on returning a more sensible error here.

-K
