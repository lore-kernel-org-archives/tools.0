Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09F110E2
	for <tools@linux.kernel.org>; Wed, 28 Sep 2022 13:56:20 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id l14so8164941qvq.8
        for <tools@linux.kernel.org>; Wed, 28 Sep 2022 06:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=U0pQSwCagFn8xTZ4xwY78N56A9cIEAimG7Cl42tkqKE=;
        b=OIx7c804aXb5DZeEVftOpng3y6eKnS6xJ47pHBLQJb5kpJc0nyCVgh3jLy6yVvpzba
         XEURT93mc0xyK8NrcfL0UUlBLSSvrGldEElebkv+PzkCKeVgo8Z7tWlV+6KAYzjGdyYk
         GZnsY6IybDMJEb0pvwAtfssb4GgoukYB1UQug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=U0pQSwCagFn8xTZ4xwY78N56A9cIEAimG7Cl42tkqKE=;
        b=LYKY1lZqlo0Oai0IJXwzcnp4X1s9GRdhGlI/bNlts9nPp+YPfE52chFooMqIj6AdLe
         AuSdhWiQGARUzKX+7M8NDUAhZCy0vPag/0lrO6ouq8xHkqtzDiwfjnN5CjlQ5gUFlN8o
         +oxsCkZZ4UlA3hlZExLygL1GJBJmGUVFw6oVfXCQuYE+zlLuu86NEMq3QPsjQHEiINwt
         Bo56NcmuV3UIfvMBpv+FJBhryu0ohW38ZoyiC1sMwbOa6xJ0OVCc+NydvFpidFUExGVS
         fnRzm3+Aw6XGd5tTPxwPqSQyWLyS+U66qBn9OudiNnV+ExhchB78CyPdIQVXVmEPv8sj
         HZyg==
X-Gm-Message-State: ACrzQf2+35UKJe+OPxqQX0reaLymWlIaISgJHQhr8q3TbFT2odAmKMGZ
	oCs45A+cjBCm/Hjw1J+MR2lSSQ==
X-Google-Smtp-Source: AMsMyM6MALaQUxNvTMjpgpdDwG/rSisfv9fh051oGYRYxv3KViIcKiYdH08P40PjX7k4QBKFLdZzSw==
X-Received: by 2002:ad4:5c4d:0:b0:4ac:942f:78b0 with SMTP id a13-20020ad45c4d000000b004ac942f78b0mr25762022qva.48.1664373379278;
        Wed, 28 Sep 2022 06:56:19 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id az11-20020a05620a170b00b006b615cd8c13sm3070565qkb.106.2022.09.28.06.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 06:56:18 -0700 (PDT)
Date: Wed, 28 Sep 2022 09:56:17 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 send crashes when sendemail from is missing
Message-ID: <20220928135617.ffe5gd23vr5f2lp7@meerkat.local>
References: <eb5d38af-ed64-38fd-2515-e489120cbb0b@linaro.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eb5d38af-ed64-38fd-2515-e489120cbb0b@linaro.org>

On Wed, Sep 28, 2022 at 11:37:45AM +0200, Neil Armstrong wrote:
> Hi !
> 
> First, thanks for the b4 work !
> I've finally tried the b4 prep/send feature and when doing the first send I got this crash:
> 
> $ b4 send --no-sign

Or, you know, you can just sign things. ;)

> I figured the "from" field was missing from my gitconfig sendemail entry.
> 
> I checked and nowhere this "from" is required for git-send-email, perhaps get user.email or sendemail.smtpuser as fallback ?

Yes, the latest master/stable-0.10.y will fall back to user.email if
sendemail.from is not set. Thank you for the report.

-K
