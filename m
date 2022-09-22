Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30D67C
	for <tools@linux.kernel.org>; Thu, 22 Sep 2022 18:03:11 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id ml1so7397361qvb.1
        for <tools@linux.kernel.org>; Thu, 22 Sep 2022 11:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=gTd8Tjq8P/HYG1w/Hmlmpm/0vR9stkAuwDSBFjEEt7Q=;
        b=hcjSc8lIUiG/U4j6zTpc36eTexNLpNvIxNP+w3uiABdC/Bv1TEAkU+hR2BKu8BZdXo
         pri0JwqMnaYlkVDm3G/rEnw+e/oFn1DKcKcvhEG7ubFZf+RY3bpgXsn/46sUYWn9aHqr
         98Ml456w13s+ge1ZNuTFxV1lXYcW7JA5vOzws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gTd8Tjq8P/HYG1w/Hmlmpm/0vR9stkAuwDSBFjEEt7Q=;
        b=cgCIZLQ416w0h+CrfdkdcYf5+yxlbKIjIza4D4LIrEQm3YmQ/uaubG+ipuvrm0cW/w
         xWxJZ1CAzQtcnhFAUq7iuboyzeaAseg1JV0wRmIvX3upvWzB4yI/X3WmsBkRYL8gSmQz
         lWLpA94guc8blG63goFdGqZotI/JT6gu3hCnCQEgSX7icorDBmVgMRjZcZu6Xgvgiq33
         P6hL9QQ3fniMXGZZPdi5RPmVGY1QlQIiF3WAGkoXsF2IGE6fcTVKwOTORb65uXk2GRmK
         OUBW/9ZEIro5ztyaIQZBT7FY2Yvch47Az7TPapLO8uBL3Juq84YNrqKcfAFfXCqNUPPn
         VusQ==
X-Gm-Message-State: ACrzQf0ap2/NrXDo151mcHme3dwbRJITwSyaXryxLrBgyFQmWx1AizOx
	S1tKEoXrxc/A9OSOO1Njh3ATzw==
X-Google-Smtp-Source: AMsMyM7Akq+08xEMQO5bRfX68PcjOIshpThSNp2insk7ytH0pQFHw2RPf6dQJHn5T/KHwe3wwyJihw==
X-Received: by 2002:a05:6214:cab:b0:4a7:3c1a:a4d7 with SMTP id s11-20020a0562140cab00b004a73c1aa4d7mr3631604qvs.50.1663869790655;
        Thu, 22 Sep 2022 11:03:10 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id y7-20020a05620a44c700b006bbc09af9f5sm4484794qkp.101.2022.09.22.11.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 11:03:10 -0700 (PDT)
Date: Thu, 22 Sep 2022 14:03:08 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Guillaume Ranquet <granquet@baylibre.com>, tools@linux.kernel.org
Subject: Re: b4 send: missing diffstat in individual patches
Message-ID: <20220922180308.ap6bi2qcbxmeovmq@meerkat.local>
References: <CABnWg9uBOGqJMq=yCtn7SoEME=+2u1-ZK9ftb6=_jRhkhL_jiw@mail.gmail.com>
 <20220922132910.gz66mwjcdd7ljd6j@meerkat.local>
 <20220922142216.vpetai65om2bvv4l@meerkat.local>
 <87mtarfov3.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87mtarfov3.fsf@baylibre.com>

On Thu, Sep 22, 2022 at 04:46:56PM +0200, Mattijs Korpershoek wrote:
> > On Thu, Sep 22, 2022 at 09:29:10AM -0400, Konstantin Ryabitsev wrote:
> >> > The serie was sent with 0.10.0-dev (master from some weeks ago).
> >> > I've just retried a dry-run with the latest and the diffstat is still missing.
> >> > 
> >> > I haven't seen any option in b4 send to produce the individual commit
> >> > diffstat, I will have
> >> > a quick look if I can propose a patch.
> >> 
> >> I'll try to put that in today.
> >
> > This was an easy fix, so it's in master. I'll backport it into 0.10.y stable
> > later today.
> 
> Thank you for all the work you've put in the "contributor" side of b4.
> Your responsive replies and fixes are really appreciated, and so
> is the new documentation.

I'm glad people are using it! I'm sure there will be a lot of changes to my
initial implementation, and that was entirely expected.

Best regards,
Konstantin
