Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B393FCD
	for <tools@linux.kernel.org>; Thu,  2 Sep 2021 18:56:13 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id bn14so1783590qvb.12
        for <tools@linux.kernel.org>; Thu, 02 Sep 2021 11:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O8/RDCNQEm3cp7V/yFQJ3Q12INOs56steSFm8nv9ktE=;
        b=cxBHrjkH0/g4PHVfxQiFSQTFloxCziWxl6sygc5m+aNkF0qCY/qUHeE7tuAi38xYwg
         enmwU2xI7notKHQX6zZ7xQEjAL3GqxZUylckFCS0kEyJkfaNiNntrC2oonkbejZ56K8N
         2tfnNh27gi0sob/hY6hCNFRC/+vNUmgy4Nbfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O8/RDCNQEm3cp7V/yFQJ3Q12INOs56steSFm8nv9ktE=;
        b=uc03WlCzIXTXbkvN++rQ29SiKvBfmY2jRIduLisNUZnaDpVHV7isWrCiXi1hZepiqi
         sStJaBtq3F9UoSjO+0M7F36k3mYEQUFERSwtlCp/42EXh9zEwjghz1Ey5cwUgJnSl9tK
         F5bNhQsakNud4yl8mWR66T2JsQd7m62JNMmi3qG6+qPZ+dm4SEnXVnfGtgo0WFhS9sd7
         UNqf4iQ6d8cCeCVu/QtU52Y5qrr+bROmbbND5kHcdY/gNZ0ZBxG33Bo0xantEQc+Rpyo
         CXro6NtKN8g+cU04L/+8w8p9U+2a2kjV/0SUXP7iVm7rXpntzrm8dVCe3a7JUbz6QZPe
         ly6g==
X-Gm-Message-State: AOAM531zbSZ+7FlVHi6BzJmVEN4I27icEqFwwAOqyHzcr40St4FhTSUi
	KcXpVwM2DktqdEyvzUD184b+Dw==
X-Google-Smtp-Source: ABdhPJxxaax0cUDuoTV/HlhOsQakvU5F9dvRggSDtGBLxUof5eEH+38OqMhKCYftD72VVgsDfkhw/g==
X-Received: by 2002:a05:6214:130a:: with SMTP id a10mr4639027qvv.53.1630608972014;
        Thu, 02 Sep 2021 11:56:12 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id q192sm2023936qka.93.2021.09.02.11.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 11:56:11 -0700 (PDT)
Date: Thu, 2 Sep 2021 14:56:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210902185610.aejfdhjl52l2ivpb@meerkat.local>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
 <20210902184543.GA1133629@roeck-us.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210902184543.GA1133629@roeck-us.net>

On Thu, Sep 02, 2021 at 11:45:43AM -0700, Guenter Roeck wrote:
> > My tests of the new lore.kernel.org service (currently running on
> > x-lore.kernel.org) are looking good, so I will be putting that into production
> > on Wednesday, September 1, 2021.
> > 
> 
> It appears that lore.kernel.org/patchwork is gone. Is that on purpose,
> and/or is there a new link ?

It's gone forever, see this PSA, which was also sent to this list.
https://lore.kernel.org/all/20210820171633.43xhblvzuk4swxln@nitro.local/

-K
