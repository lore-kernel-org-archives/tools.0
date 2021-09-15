Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27513FC9
	for <tools@linux.kernel.org>; Wed, 15 Sep 2021 12:15:24 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id cf2so1690932qvb.10
        for <tools@linux.kernel.org>; Wed, 15 Sep 2021 05:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1dZZ2d72F329F6pv79IDzRCpiR58gN9GTl0BzgK1aQ0=;
        b=QhhcPmFeLG34Ba8od8Us5Av6AWhuT8y0p9Aw3hSb+N29yuatY0RhPr2kJpN/JOEqoY
         +pLhKdmhsL99/5+EefrfaS49UbzjPPOlWrtGRtx91BGTIDxtUgWcmEZpJSMqhckCGMWX
         tG5/TwP3IYLiYxn8D+mpR5GfgEaQsSh+tixE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1dZZ2d72F329F6pv79IDzRCpiR58gN9GTl0BzgK1aQ0=;
        b=O9xVdSbnDv/urO0bJn4awiCKfxwC5MMwLOK9fUy8zAVnGX2tYGKHYxtFOY+e8OEcL4
         GCmQyohHxq7/iEJCXts61iHvydm97LnzgaSlgmKwkdaqtRf1aFUylnB9e8Duz0Id/PU4
         AuSCLsSTY1KRKb2DfZKhfR/fc8cabyqm9Uz5J52s/rJxMHH8O/IHivgo0FuziDrG/mP4
         20zFyYE/d0ZI6zaxd30usxiiN0ajRe3UIDy9BK3fx+MjQy8ZBakMJhN7M6lVJGqGBuw9
         17SMVHcItk1xvBBPWxmQrIP5k9vesWA9kzelICIFoosLeuHXAAf0F6U81mcGYdREgwu3
         1uTg==
X-Gm-Message-State: AOAM530hhNcH6JiWcX6GqVQQqICZ53gdsnGklV9RBctMRe6LnOeH/jyG
	mZ10gqVnR6CVDGheQmUKF0E65w==
X-Google-Smtp-Source: ABdhPJzvxDIZb08t9GpWETQL2KtSwjpVC4MSAyowx2aB60ygxJyPmzFuk4A309Xr+Ng7GXbe7n4u2Q==
X-Received: by 2002:ad4:47ad:: with SMTP id a13mr10329595qvz.61.1631708123918;
        Wed, 15 Sep 2021 05:15:23 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id v7sm10002324qkd.41.2021.09.15.05.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 05:15:23 -0700 (PDT)
Date: Wed, 15 Sep 2021 08:15:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210915121521.fdsoxbwsfphbxyab@meerkat.local>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
 <20210901131259.7slxtcftirxb4bhp@linutronix.de>
 <20210901132519.vxw2wrly4pifnorv@meerkat.local>
 <20210915120555.3goilbwqeertbexe@linutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210915120555.3goilbwqeertbexe@linutronix.de>

On Wed, Sep 15, 2021 at 02:05:55PM +0200, Sebastian Andrzej Siewior wrote:
> Thanks.
> I've been just pointed to this behaviour:
>   https://lore.kernel.org/netdev/
> 
> has a search field at the top. But if you use
>   https://lkml.kernel.org/netdev/
> 
> then there is the archive with no search field. A redirect to lore would
> be nice.

This distinction is intentional -- lkml.kernel.org is the primary system from
where lore.kernel.org nodes replicate. Being able to access lkml.kernel.org
without a redirect is a feature, so I can't easily fix this.

-K
